# How to seed development data

```ruby
# lib/development/seeder.rb

require "factory_bot"

module Development
  class Seeder
    include FactoryBot::Syntax::Methods

    def self.load_seeds
      new.load_seeds
    end

    def load_seeds
      emails = %w[ralph@example.com ruby@example.com]

      emails.each do |email|
        create(:user, email:, password: "password") unless User.exists?(email:)
      end
    end
  end
end
```

```rb
# lib/tasks/development.rake

abort "Seeds can only be loaded in local environments" unless Rails.env.local?

namespace :development do
  namespace :db do
    desc "Loads seed data into development."
    task seed: :environment do
      Development::Seeder.load_seeds
    end

    namespace :seed do
      desc "Truncate tables of each database for development and loads seed data."
      task replant: [ "environment", "db:truncate_all", "development:db:seed" ]
    end
  end
end
```
