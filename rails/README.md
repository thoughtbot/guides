# Rails

- Avoid `member` and `collection` routes.
- Use private instead of protected when defining controller methods.
- Name date columns with `_on` suffixes.
- Name datetime columns with `_at` suffixes.
- Name time columns (referring to a time of day with no date) with `_time`
  suffixes.
- Name initializers for their gem name.
- Order ActiveRecord associations alphabetically by association type, then
  attribute name. [Example](/rails/sample.rb#L2-L4).
- Order ActiveRecord validations alphabetically by attribute name.
- Order ActiveRecord associations above ActiveRecord validations.
- Order controller contents: filters, public methods, private methods.
- Order i18n translations alphabetically by key name.
- Order model contents: constants, macros, public methods, private methods.
- Put application-wide partials in the [`app/views/application`] directory.
- Use `def self.method`, not the `scope :method` DSL. #643
- Use the default `render 'partial'` syntax over `render partial: 'partial'`.
- Use `link_to` for GET requests, and `button_to` for other HTTP verbs.
- Use new-style `validates :name, presence: true` validations, and put all
  validations for a given column together. [Example](/rails/sample.rb#L6).
- Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
- Avoid instantiating more than one object in controllers.
- Avoid naming methods after database columns in the same class.
- Don't reference a model class directly from a view.
- Don't return false from `ActiveModel` callbacks, but instead raise an
  exception.
- Don't use instance variables in partials. Pass local variables to partials
  from view templates.
- Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of
  models.
- Generate necessary [Spring binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
- Keep `db/schema.rb` or `db/development_structure.sql` under version control.
- Use only one instance variable in each view.
- Use the [`.ruby-version`] file convention to specify the Ruby version and
  patch level for a project.
- Use `_url` suffixes for named routes in mailer views and [redirects]. Use
  `_path` suffixes for named routes everywhere else.
- Validate the associated `belongs_to` object (`user`), not the database column
  (`user_id`).
- Use `db/seeds.rb` for data that is required in all environments.
- Use `dev:prime` rake task for development environment seed data.
- Prefer `cookies.signed` over `cookies` to [prevent tampering].
- Prefer `Time.current` over `Time.now`
- Prefer `Date.current` over `Date.today`
- Prefer `Time.zone.parse("2014-07-04 16:05:37")` over `Time.parse("2014-07-04
  16:05:37")`
- Use `ENV.fetch` for environment variables instead of `ENV[]`so that unset
  environment variables are detected on deploy.
- [Use blocks](/ruby/sample_2.rb#L10) when declaring date and time attributes in
  FactoryBot factories.
- Use `touch: true` when declaring `belongs_to` relationships.

[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30
[spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[prevent tampering]: http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html
[`app/views/application`]: http://railscasts.com/episodes/269-template-inheritance

## Migrations

[Sample](migration.rb)

- Set an empty string as the default constraint for non-required string and text
  fields. [Example](migration.rb#L6).
- Set an explicit [`on_delete` behavior for foreign keys].
- Don't change a migration after it has been merged into `main` if the desired
  change can be solved with another migration.
- If there are default values, set them in migrations.
- Use SQL, not `ActiveRecord` models, in migrations.
- [Add foreign key constraints] in migrations.

[`on_delete` behavior for foreign keys]: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_foreign_key
[add foreign key constraints]: http://robots.thoughtbot.com/referential-integrity-with-foreign-keys

## Routes

- Avoid the `:except` option in routes.
- Order resourceful routes alphabetically by name.
- Use the `:only` option to explicitly state exposed routes.

## Background Jobs

- Define a `PRIORITY` constant at the top of delayed job classes.
- Define two public methods: `self.enqueue` and `perform`.
- Put delayed job classes in `app/jobs`.

## Email

- Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users].

[delivering email on behalf of the app's users]: http://robots.thoughtbot.com/post/3215611590/recipe-delivering-email-on-behalf-of-users

## Code Review

Follow the normal [Code Review guidelines](/code-review/). When reviewing
others' Rails work, look in particular for:

- Review data integrity closely, such as migrations that make irreversible
  changes to the data, and whether there is a related todo to make a database
  backup during the staging and production deploys.
- Review SQL queries for potential SQL injection.
- Review whether dependency upgrades include a reason in the commit message,
  such as a link to the dependency's `ChangeLog` or `NEWS` file.
- Review whether new database indexes are necessary if new columns or SQL
  queries were added.
- Review whether new scheduler (`cron`) tasks have been added and whether there
  is a related todo in the project management system to add it during the
  staging and production deploys.

## Asset Management

- Use [ActiveStorage] to manage file uploads that live on ActiveRecord objects.
- Don't use live storage backends like S3 or Azure in tests.

[ActiveStorage]: https://guides.rubyonrails.org/active_storage_overview.html

## How to...

- [Start a New Rails App](./how-to/start_a_new_rails_app.md)
- [Deploy a Rails App to Heroku](./how-to/deploy_a_rails_app_to_heroku.md)
- [Feature-test JavaScript in a Rails App](./how-to/feature_test_javascript_in_a_rails_app.md)
