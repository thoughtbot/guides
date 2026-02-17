# Database & Migrations

- Every foreign key must have an index. Every `where` column should have an index.
- Always eager-load associations when iterating: `includes`, `preload`, or `eager_load`.
- Migrations must be reversible. Never modify data in structure migrations.
- Add `null: false` and database-level defaults where appropriate.
- Use `text` over `string` if length varies significantly.
- Wrap multi-record operations in transactions. Use `save!` (bang) inside transactions.
- Keep scopes as one-liners. Complex queries belong in search/query objects.
- Never use `Post.all` without pagination. Avoid `.count` in loops — use `counter_cache`.
