# Project: [APP_NAME]

[One sentence: what the app does and who it serves.]

## Commands

```bash
bin/dev                               # Start dev server and worker
bin/rails spec                        # Full test suite (Suspenders rake task)
bundle exec rspec spec/models         # Model specs only
bundle exec rspec spec/requests       # Request specs only
bundle exec rspec spec/path/to/file_spec.rb  # Run all tests in file
bundle exec rspec spec/path/to/file_spec.rb:72  # Run just the test at line 72
bundle exec rubocop                   # Lint
bundle exec rubocop -a                # Auto-fix lint issues
bin/rails db:migrate                  # Run migrations
bundle audit                          # Check gem vulnerabilities
bin/ci                                # Run all tests, linters, and security scanners
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
