# Controllers

- Controllers handle HTTP only: receive request, delegate to model, return response.
- Actions must not exceed 10 lines (excluding strong params).
- Maximum one instance variable per action.
- No business logic, calculations, email sending, or multi-object operations in controllers.
- Always use strong parameters. Never `params.permit!`.
- Return `status: :unprocessable_entity` on failed form renders (required by Turbo).
- Prefer RESTful routes. Custom actions often mean a missing resource — e.g., `POST /order_cancellations` not `POST /orders/cancel`.
- Use `before_action` for auth. Be explicit with `only:` / `except:`.
