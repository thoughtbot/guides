# Filter sensitive information from external network requests

If you’re using Faraday, it’s your responsibility to [filter sensitive
information][1] when logging requests. This does not happen by default.

```ruby
conn = Faraday.new(url: "http://httpbingo.org") do |builder|
  builder.response :logger do | logger |
    logger.filter(/(api_key=)([^&]+)/, '\1[REMOVED]')
  end
end
```

However, since Rails provides an [API for filtering parameters][2], we can
create a [custom formatter][3] to re-use that configuration.

```ruby
conn = Faraday.new(url: "http://httpbingo.org") do |builder|
  builder.response :logger, nil, {
    formatter: ApplicationFormatter
  }
end

class ApplicationFormatter < Faraday::Logging::Formatter
  def request(env)
    info("Request") { log_url(env.url) }
    info("Request") { log_body(env.body) } if env.body && log_body?
  end

  def response(env)
    info("Response") { log_url(env.url) }
    info("Response") { log_body(env.body) } if env.body && log_body?
  end

  private

  # Re-uses existing configuration from config/initializers/filter_parameter_logging.rb
  def filter_parameters
    @filter_parameters ||= Rails.configuration.filter_parameters
  end

  # Filters parameters
  def parameter_filter(**options)
    ActiveSupport::ParameterFilter.new(filter_parameters, **options)
  end

  def parse_json(json)
    JSON.parse(json, object_class: HashWithIndifferentAccess)
  end

  def log_body?
    @options[:bodies]
  end

  def log_body(body)
    result = walk(body)

    parameter_filter.filter(result).pretty_inspect
  end

  def log_url(url)
    filtered_url = filter_url(url)

    filtered_url.to_s
  end

  def filter_url(url)
    return url if url.query.nil?

    params = URI.decode_www_form(url.query).to_h
    filtered_params = parameter_filter(mask: "FILTERED").filter(params)
    url.query = URI.encode_www_form(filtered_params)
  end

  def walk(obj)
    case obj
    when Hash
      obj.transform_values { walk(_1) }
    when Array
      obj.map { walk(_1) }
    when String
      parse_json(obj)
    else
      obj
    end
  rescue JSON::ParserError
    obj
  end
end
```

[1]: https://lostisland.github.io/faraday/#/middleware/included/logging?id=filter-sensitive-information
[2]: https://guides.rubyonrails.org/action_controller_advanced_topics.html#parameters-filtering
[3]: https://lostisland.github.io/faraday/#/middleware/included/logging?id=customize-the-formatter
