# Models & Domain Objects

- No service objects. All domain classes live in `app/models/` with namespaces, never `app/services/`.
- Name classes after domain nouns, not actions. No `*Service`, `*Manager`, `*Handler` suffixes.
- Use `ActiveModel::Model` for POROs that need validation or form integration.
- Replace `.call` / `.perform` with domain verbs: `#save`, `#complete`, `#submit`, `#deliver`.
- Callbacks only for data integrity (normalise fields, set defaults). Never for emails, payments, or external systems.
- Prefer composition over inheritance. Extract behaviour into small, focused objects.
- Avoid feature envy, case statements on type, and mixin abuse.
