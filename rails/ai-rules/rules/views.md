# Views & Presenters

- Views render data. No calculations, queries, or complex conditionals.
- Use presenters to display logic. Instantiate in controller, use in view.
- Extract repeated markup into partials. Pass data via `locals:`, not instance variables.
- Helpers for simple formatting only (dates, currencies). If longer than 5 lines, use a presenter.
- Turbo: return `status: :unprocessable_entity` on failed forms. Keep Stimulus controllers small.
- Suspenders provides `_flashes.html.erb` and `_form_errors.html.erb` partials — use them.
