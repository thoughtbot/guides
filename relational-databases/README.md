# Relational Databases

- [Index foreign keys].
- Constrain most columns as [`NOT NULL`].
- In a SQL view, only select columns you need (i.e., avoid `SELECT table.*`).
- Use an `ORDER BY` clause on queries where the results will be displayed to a
  user, as queries without one may return results in a changing, arbitrary
  order.

[index foreign keys]: https://thoughtbot.com/blog/a-grand-piano-for-your-violin
[`not null`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444
