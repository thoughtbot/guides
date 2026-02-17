# Models & Domain Objects

- No service objects. All domain classes live in `app/models/` with namespaces, never `app/services/`.
- Name classes after domain nouns, not actions. No `*Service`, `*Manager`, `*Handler` suffixes.
- Use `ActiveModel::Model` for POROs that need validation or form integration.
- Replace `.call` / `.perform` with domain verbs: `#save`, `#complete`, `#submit`, `#deliver`.
- Extract from ActiveRecord models when they exceed: 200 lines, 15 public methods, or 7 private methods.
- Callbacks only for data integrity (normalise fields, set defaults). Never for emails, payments, or external systems.
- Prefer composition over inheritance. Extract behaviour into small, focused objects.
- Avoid feature envy, long parameter lists (max 3 args), case statements on type, and mixin abuse.
