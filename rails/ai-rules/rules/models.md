# Models & Domain Objects

- No service objects. All domain classes live in `app/models/` with namespaces, never `app/services/`.
- Name classes after domain nouns, not actions. No `*Service`, `*Manager`, `*Handler` suffixes.
- Use `ActiveModel::Model` for POROs that need validation or form integration.
- Replace `.call` / `.perform` with domain verbs: `#save`, `#complete`, `#submit`, `#deliver`.
- Look to identify domain models that can be extracted when an existing model is large.
- Callbacks only for data integrity (normalise fields, set defaults). Never for emails, payments, or external systems.
- Prefer composition over inheritance. Extract behaviour into small, focused objects.
- Avoid feature envy, long parameter lists, case statements on type, and mixin abuse.
