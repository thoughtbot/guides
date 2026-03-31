# [APP_NAME]

[One sentence: what the app does and who it serves.]

## Commands

```bash
bin/rails server                      # Start dev server
bin/rails spec                        # Full test suite (Suspenders rake task)
bundle exec rspec spec/models         # Model specs only
bundle exec rspec spec/requests       # Request specs only
bundle exec rspec spec/path/to/file_spec.rb  # Run all tests in file
bundle exec rspec spec/path/to/file_spec.rb:72  # Run just the test at line 72
rake standard                         # Lint
rake standard:fix                     # Auto-fix lint issues
bin/rails db:migrate                  # Run migrations
bin/rails suspenders:db:migrate       # Migrate + annotate
bin/rails suspenders:cleanup:organize_gemfile  # Sort Gemfile
bundle audit                          # Check gem vulnerabilities
bin/rails routes                      # View routes
```

## Controllers

- Controllers handle HTTP only: receive request, delegate to model, return response.
- Actions should not exceed 10 lines (excluding strong params). Longer actions often signal business logic that belongs in a model or PORO.
- Maximum one instance variable per action.
- No business logic, calculations, email sending, or multi-object operations in controllers.
- Always use strong parameters. Never `params.permit!`.
- Return `status: :unprocessable_entity` on failed form renders (required by Turbo).
- Prefer RESTful routes. Custom verb actions (e.g., post "activate") usually mean a missing noun/resource (e.g., resource :trial, only: [:create]).

## Models & Domain Objects

- No service objects. All domain classes live in `app/models/` with namespaces, never `app/services/`.
- Name classes after domain nouns, not actions. No `*Service`, `*Manager`, `*Handler` suffixes.
- Use `ActiveModel::Model` for POROs that need validation or form integration.
- Replace `.call` / `.perform` with domain verbs: `#save`, `#complete`, `#submit`, `#deliver`.
- Look to identify domain models that can be extracted when an existing
  model exceeds: 200 lines, 15 public methods, or 7 private methods.
- Callbacks only for data integrity (normalise fields, set defaults). Never for emails, payments, or external systems.
- Prefer composition over inheritance. Extract behaviour into small, focused objects.
- Avoid feature envy, long parameter lists (max 3 args), case statements on type, and mixin abuse.

## Testing

- Must use TDD. Write tests first and follow red, green, refactor.
- Must not use let or before in specs (avoid mystery guests). Do test setup
  within each test.
- Test behaviour, not implementation. Four Phase Test: setup, exercise, verify, teardown.
- Test pyramid: many model/PORO unit specs, some request specs, few system specs.
- Every public method on every model and PORO must have at least one spec.
- Every branch in a conditional must have at least one spec.
- Use `build` / `build_stubbed` over `create` unless persistence is needed.
- Factories: only required attributes with sensible defaults. Start in `spec/factories.rb`.
- Shoulda Matchers for validations and associations.
- WebMock blocks all external HTTP in tests — always stub external requests.
- One `expect` per `it` block. Max 2 levels of context nesting.
- Never test private methods directly. Never stub the system under test.

## Security

- Never interpolate user input into SQL. Use parameterised queries or `where(key: value)`.
- Always use strong parameters. Never `params.permit!`.
- Scope all queries to the current user or use Pundit authorisation.
- Every controller must have authentication unless explicitly public.
- Never use `raw`, `html_safe`, or `<%==` with user-supplied data.
- Never skip CSRF verification for browser-facing controllers.
- Filter sensitive params in logs: passwords, tokens, secrets, API keys.
- Never `render json: model` without explicit `only:` — whitelist attributes.
- Never redirect to `params[:return_to]` without validation.
- Use array form for system commands: `system("cmd", arg)`, never `system("cmd #{arg}")`.

## Views & Presenters

- Views render data. No calculations, queries, or complex conditionals.
- Use presenters to display logic. Instantiate in controller, use in view.
- Extract repeated markup into partials. Pass data via `locals:`, not instance variables.
- Helpers for simple formatting only (dates, currencies). If longer than 5 lines, use a presenter.
- Turbo: return `status: :unprocessable_entity` on failed forms. Keep Stimulus controllers small.

## Database & Migrations

- Always use the `rails generate migration` command to create migration files.
- Migrations must be reversible.
- Add `null: false` and database-level defaults where appropriate.
- Use `text` over `string` if length varies significantly.
- Wrap multi-record operations in transactions. Use `save!` (bang) inside transactions.
- Keep scopes as one-liners. Complex queries belong in search/query objects.
- Never use `Post.all` without pagination.
- Avoid `.count` in loops.
- Use `counter_cache`.
