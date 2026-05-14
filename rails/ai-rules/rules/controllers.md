# Controllers

- Controllers handle HTTP only: receive request, delegate to model, return response.
- Maximum one instance variable per action.
- No business logic, calculations, email sending, or multi-object operations in controllers.
- Return `status: :unprocessable_entity` on failed form renders (required by Turbo).
- Prefer RESTful routes. Custom verb actions (e.g., post "activate") usually mean a missing noun/resource (e.g., resource :trial, only: [:create]).
