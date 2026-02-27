# Security

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
