# Rails

## Application

- Name initializers for their gem name.
- Use `lib` for code that is not app-specific and could later be extracted into a gem.
- Use `app/jobs` for code that doesn't need to return anything and can be run asynchronously.
- Generate necessary [Spring binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
- Use the [`.ruby-version`] file convention to specify the Ruby version and patch level for a project.
- Prefer `cookies.signed` over `cookies` to [prevent tampering].
- Use `ENV.fetch` for environment variables instead of `ENV[]`so that unset
  environment variables are detected on deploy.

[spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[prevent tampering]: https://www.bigbinary.com/blog/cookies-on-rails

## Routes

- Avoid the `:except` option in routes.
- Avoid `member` and `collection` routes.
- Order resourceful routes alphabetically by name.
- Use the `:only` option to explicitly state exposed routes.
- Prefer [resource routing] over [generating routes] individually
- Use `_url` suffixes for named routes in mailer views and [redirects]. Use `_path` suffixes for named routes everywhere else.

[resource routing]: https://guides.rubyonrails.org/routing.html#resource-routing-the-rails-default
[generating routes]: https://guides.rubyonrails.org/routing.html#generating-paths-and-urls-from-code
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30

## Views and UI

- Put application-wide partials in the [`app/views/application`] directory.
- Use the default `render 'partial'` syntax over `render partial: 'partial'`.
- Use `link_to` for GET requests, and `button_to` for other HTTP verbs.
- Don't reference a model class directly from a view.
- Don't use instance variables in partials. Pass local variables to partials from view templates.
- Use only one instance variable in each view.

[`app/views/application`]: http://railscasts.com/episodes/269-template-inheritance

## Controllers

- Use private instead of protected when defining controller methods.
- Order controller contents: filters, public methods, private methods.
- Avoid instantiating more than one object in controllers.

## Models

Guidance on ActiveRecord, ActiveModel, and other model objects.

- Order ActiveRecord associations alphabetically by association type, then
  attribute name. [Example](/rails/sample.rb#L2-L4).
- Order ActiveRecord validations alphabetically by attribute name.
- Order ActiveRecord associations above ActiveRecord validations.
- Order model contents: constants, macros, public methods, private methods.
- Use `def self.method`, not the `scope :method` DSL. [#643](https://github.com/thoughtbot/guides/pull/643)
- Use new-style `validates :name, presence: true` validations, and put all
  validations for a given column together. [Example](/rails/sample.rb#L6).
- Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
- Avoid naming methods after database columns in the same class.
- Don't return false from `ActiveModel` callbacks, but instead raise an exception.
- Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of models.
- Validate the associated `belongs_to` object (`user`), not the database column (`user_id`).
- Use `touch: true` when declaring `belongs_to` relationships.
- Use [Pundit][] when you need to restrict access to models and data.

[Pundit]: https://github.com/varvet/pundit

## Database and Persistence

- Name date columns with `_on` suffixes.
- Name datetime columns with `_at` suffixes.
- Back boolean concepts like deleted? or published? with timestamps columns in the database `deleted_at`, `published_at`.
  This can be valuable when you need to know **when** something took place. [Time for A Boolean](https://github.com/calebhearth/time_for_a_boolean) provides a nice interface for this.
- Name time columns (referring to a time of day with no date) with `_time`
  suffixes.
- Keep `db/schema.rb` or `db/development_structure.sql` under version control.
- Use `db/seeds.rb` for data that is required in all environments.
- Use `dev:prime` rake task for development environment seed data.

## Migrations

[Sample](migration.rb)

- Set an empty string as the default constraint for **non-required** string and text
  fields. [Example](migration.rb#L6). [#159](https://github.com/thoughtbot/guides/pull/159)
- Set an explicit [`on_delete` behavior for foreign keys].
- Don't change a migration after it has been merged into `main` if the desired
  change can be solved with another migration.
- If there are default values, set them in migrations.
- Use SQL, not `ActiveRecord` models, in migrations.
- [Add foreign key constraints] in migrations.

[`on_delete` behavior for foreign keys]: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_foreign_key
[add foreign key constraints]: http://thoughtbot.com/blog/referential-integrity-with-foreign-keys

## Factories

- [Use blocks](/ruby/sample_2.rb#L10) when declaring date and time attributes in FactoryBot factories.

## Temporal

- Prefer `Time.current` over `Time.now`
- Prefer `Date.current` over `Date.today`
- Prefer `Time.zone.parse("2014-07-04 16:05:37")` over `Time.parse("2014-07-04
  16:05:37")`

## Translations

- Ensure that the application is setup to support multiple locales.
- Ensure that the application raises an error when a translation is missing for a
  given locale in development and tests.
- Order i18n translations alphabetically by key name.

## Email

- Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users].

[delivering email on behalf of the app's users]: http://thoughtbot.com/blog/delivering-email-on-behalf-of-users

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

## Testing

- Prefer [webmock][] over [VCR][].

[webmock]: https://github.com/webmock/webmock
[VCR]: https://github.com/vcr/vcr

## How To Guides

- [Start a New Rails App](./how-to/start_a_new_rails_app.md)
- [Deploy a Rails App to Heroku](./how-to/deploy_a_rails_app_to_heroku.md)
- [Feature-test JavaScript in a Rails App](./how-to/feature_test_javascript_in_a_rails_app.md)
