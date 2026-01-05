# How to seed development data

```ruby
# lib/development/seeder.rb

module Development
  class Seeder
    def self.load_seeds
      if Rails.env.development?
        new.load_seeds
      else
        raise "Development::Seeder can only be run in a development environment."
      end
    end

    def load_seeds
      #   ["Ruby", "Ralph"].each do |name|
      #     User.find_or_create_by!(name:)
      #   end
    end
  end
end
```

```rb
# lib/tasks/development.rake

if Rails.env.development?
  namespace :development do
    namespace :db do
      desc "Loads seed data into development."
      task seed: ["environment", "db:seed"] do
        Development::Seeder.load_seeds
      end

      namespace :seed do
        desc "Truncate tables of each database for development and loads seed data."
        task replant: ["environment", "db:truncate_all", "development:db:seed"]
      end
    end
  end
end
```
