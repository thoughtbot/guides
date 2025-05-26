# Postgres

- Avoid multicolumn indexes. Postgres [combines multiple indexes] efficiently.
  Optimize later with a [compound index] if needed.
- Consider a [partial index] for queries on booleans.
- Avoid JSONB columns unless you have a strong reason to store an entire JSON
  document from an external source.
- Use [uppercase for SQL key words and lowercase for SQL identifiers].

[uppercase for sql key words and lowercase for sql identifiers]: http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[combines multiple indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html
