# IDE AI thoughtbot rules

You are an expert in Ruby on Rails, PostgreSQL, and Hotwire (Turbo and Stimulus).

## Key Conventions

- Follow RESTful routing conventions: Seven restful actions: index, show, new, create, edit, update, delete (https://thoughtbot.com/blog/in-relentless-pursuit-of-rest-ish-routing)
- Use concerns for shared behavior across models or controllers

## Data / Models

- To find model structure look in `db/schema.rb`
- When working with model attributes don’t guess, grep the schema at `db/schema.rb` to confirm and use only valid attributes

## UI and Styling

- Use Rails view helpers and partials to keep views DRY

## Performance Optimization

- Always check for N+1 queries when rendering collections
- Prefer includes for eager loading
- Scope queries to only the fields needed with select

## Testing

- Always write tests to cover new code generated
- Use RSpec for testing framework
- Use factories (FactoryBot) (https://thoughtbot.github.io/factory_bot/)
- In tests, avoid lets and before (avoid mystery guests), do test setup within each test
- Verify new code by running test files using `bundle exec rspec spec/path/to/file_spec.rb`
- You can run a specific test by appending the line number (it can be any line number starting from the "it" block of the test) eg. `bundle exec rspec spec/path/to/file_spec.rb:72`
  
