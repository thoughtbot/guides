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

## Rules

Short constraints in .claude/rules/:

rules/models.md — models conventions
rules/controllers.md — controller conventions
rules/testing.md - **MUST write tests first** TDD guidelines
rules/security.md — security guidelines
rules/views.md — No logic in views, presenter usage, Turbo conventions
rules/database.md — Indexes, N+1, migration rules, query guidelines
