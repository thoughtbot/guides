# Database & Migrations

- Always use the `rails generate migration` command to create migration files.
- Migrations must be reversible.
- Add `null: false` and database-level defaults where appropriate.
- Use `text` over `string` if length varies significantly.
- Wrap multi-record operations in transactions. Use `save!` (bang) inside transactions.
- Keep scopes as one-liners. Complex queries belong in search/query objects.
- Never use `Post.all` without pagination.
- Avoid `.count` in loops.
- Use `counter_cache`.
