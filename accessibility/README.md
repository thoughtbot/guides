# Accessibility

A guide for auditing and maintaining accessible web sites and apps.

## Basics

thoughtbot strives for AA level [Web Content Accessibility Guideline (WCAG)]
compliance. Perform one or more of these checks to ensure your work is
accessible.

### Automation

Automated checks can catch a lot of common issues before they reach production.

- Test the application in a browser (like Capybara-driven [Acceptance
  Tests](../testing-rspec/README.md#acceptance-tests))
- When using Capybara, use [CapybaraAccessibilityAudit]
- Use tools such as [WAVE] or [axe's browser extensions] to run audits on your
  local build
- Use a CI/CD solution such as [AccessLint] or [axe]. axe has integrations with popular test frameworks like RSpec and Jest

[CapybaraAccessibilityAudit]: https://github.com/thoughtbot/capybara_accessibility_audit

### Usability

[Manual usability testing] ensures things work as intended.

- Test your local build using a screen reader such as [VoiceOver] or [NVDA]
- Use auditing tools to catch issues that cannot be
  found using automated checks
  - [Accessibility Insights] accessibility auditing browser extension
  - [Readability Analyzer][simple and direct] for auditing text
  - [axe DevTools] accessibility testing browser extension
  - [WAVE Evaluation Tool] accessibility testing browser extension
  - [ARIA DevTools] browser extension for checking ARIA roles
  - [tab11y] browser extension for checking tab order
  - [WCAG Color contrast checker] browser extension
- Validate your HTML with a tool like [W3C's Markup Validation Service][w3c-markup-validator]
- Hire assistive technology users to user test your product

[axe DevTools]: https://chromewebstore.google.com/detail/axe-devtools-web-accessib/lhdoppojpmngadmnindnejefpokejbdd
[WAVE Evaluation Tool]: https://chromewebstore.google.com/detail/wave-evaluation-tool/jbbplnpkjmmeebjpijfedlgcdilocofh
[ARIA DevTools]: https://chromewebstore.google.com/detail/aria-devtools/dneemiigcbbgbdjlcdjjnianlikimpck
[tab11y]: https://chromewebstore.google.com/detail/taba11y-tab-order-accessi/aocppmckdocdjkphmofnklcjhdidgmga
[WCAG Color contrast checker]: https://chromewebstore.google.com/detail/wcag-color-contrast-check/plnahcmalebffmaghcpcmpaciebdhgdf
[w3c-markup-validator]: https://validator.w3.org/

## Quick checks

### Design

- Ensure all content's foreground color values meet the [minimum contrast ratio]
  for the background color they are placed over ([WCAG 1.4.3][wcag-1-4-3])
- Ensure all interactive content has distinct hover and focus states to help
  indicate interactivity ([WCAG 2.4.7][wcag-2-4-7])
- Ensure interactive elements [have a visible text label][rule-2]
- Ensure color is not the only way to determine meaning ([WCAG 1.4.1][wcag-1-4-1])
- Ensure interactive components use common UI affordances where applicable, to
  help users understand how they can be operated
- Prefer icons and glyphs that don't rely on specialized knowledge to understand
  their meaning, unless being used in a domain-specific context
- Prefer language that is [simple and direct] ([WCAG 3.1][wcag-3-1])
- Ensure form inputs have [labels that are visible in every state][placeholder-labels]
- Ensure link and button text is descriptive and distinct ([WCAG 2.4.4][wcag-2-4-4])
- Prefer content that is broken into logical sections, with headings that
  explain the content that follows ([WCAG 2.4.10][wcag-2-4-10])
- Prefer text sizing that is set to 16px or larger
- Ensure animation does not auto-play, can be paused, and avoids [vestibular and
  seizure triggers] ([WCAG 2.2.2][wcag-2-2-2])
- Ensure video content has captions ([WCAG 1.2.2][wcag-1-2-2])
- Prefer larger interactive target sizes, with some space between grouped
  interactive controls ([WCAG 2.5.8][wcag-2-5-8])

### Development

- Ensure every focusable or interactive element has an [accessible name][] ([WCAG 4.1.2][wcag-4-1-2])
- Follow the [Cardinal Rules of Naming][]:
  1. [Heed Warnings and Test Thoroughly][rule-1]
  2. [Prefer Visible Text][rule-2]
  3. [Prefer Native Techniques][rule-3]
  4. [Avoid Browser Fallback][rule-4]
  5. [Compose Brief, Useful Names][rule-5]
- Ensure [semantic markup][semantic-markup] is used to describe content
- Ensure content does not disappear off the screen when zoomed ([WCAG 1.4.10][wcag-1-4-10])
- Ensure that interactive content can be tabbed to and activated using the
  keyboard, and that the tab order matches reading order ([WCAG 2.1.1][wcag-2-1-1], [WCAG 2.4.3][wcag-2-4-3])
- Ensure that heading elements are used, and that heading levels are placed in a
  logical order ([WCAG 2.4.10][wcag-2-4-10])
- Ensure that [landmarks][landmark-regions] are used to describe the overall layout of the page or
  view
- Ensure that alternative descriptions for image content are concise,
  descriptive, and use punctuation (`alt` attributes for images, `title`
  elements for SVGs)
- Ensure [labels are programmatically associated][labels-associated-inputs] with their inputs
- Prefer implementing a method to allow users to skip sections of repeated
  content ([WCAG 2.4.1][wcag-2-4-1])
- Ensure each page or view has a unique title that describes the content it
  contains ([WCAG 2.4.2][wcag-2-4-2])
- The [`title` attribute is only used to describe `iframe` element contents][title-iframe]
- Ensure that [links are used to navigate to other locations and buttons are used
  to trigger actions][links-vs-buttons]
- Ensure that [focus is trapped inside of modal interactions][focus-traps]
- Ensure `fieldset` and `legend` elements are used to [group related inputs and
  label them][fieldsets-legends]
- Ensure form feedback messaging is programmatically associated with the
  relevant inputs ([WCAG 3.3.1][wcag-3-3-1])
- Ensure that dynamic changes to a web page are announced ([WCAG 4.1.3][wcag-4-1-3])
- Prefer using role selectors in automated acceptance tests
  - [capybara_accessible_selectors]
  - [Testing Library's `getByRole()`][testing-library-getbyrole]
  - [Playwright's `getByRole()`][playwright-getbyrole]

[accessible name]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/
[Cardinal Rules of Naming]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#cardinalrulesofnaming
[rule-1]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#naming_rule_heed_warnings
[rule-2]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#naming_rule_visible_text
[rule-3]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#naming_rule_native_techniques
[rule-4]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#naming_rule_avoid_fallback
[rule-5]: https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#naming_rule_brief_names
[capybara_accessible_selectors]: https://github.com/citizensadvice/capybara_accessible_selectors
[testing-library-getbyrole]: https://testing-library.com/docs/queries/byrole
[playwright-getbyrole]: https://playwright.dev/docs/locators#locate-by-role
[landmark-regions]: https://www.w3.org/WAI/ARIA/apg/practices/landmark-regions/
[labels-associated-inputs]: https://www.w3.org/WAI/WCAG22/Techniques/html/H44
[title-iframe]: https://www.w3.org/WAI/WCAG22/Techniques/html/H64
[links-vs-buttons]: https://www.nngroup.com/videos/buttons-vs-links/
[focus-traps]: https://okenlabs.com/blog/accessibility-implementing-focus-traps/
[fieldsets-legends]: https://www.w3.org/WAI/WCAG22/Techniques/html/H71
[placeholder-labels]: https://www.deque.com/blog/accessible-forms-the-problem-with-placeholders/#:~:text=A%20Placeholder%20Is%20Not%20a%20Replacement%20for%20Visible%20Labels
[semantic-markup]: https://www.w3.org/WAI/WCAG22/Techniques/html/H101

[wcag-1-4-3]: https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html
[wcag-1-4-1]: https://www.w3.org/WAI/WCAG22/Understanding/use-of-color.html
[wcag-3-1]: https://www.w3.org/WAI/WCAG22/Understanding/readable.html
[wcag-2-4-4]: https://www.w3.org/WAI/WCAG22/Understanding/link-purpose-in-context.html
[wcag-2-4-10]: https://www.w3.org/WAI/WCAG22/Understanding/section-headings.html
[wcag-2-2-2]: https://www.w3.org/WAI/WCAG22/Understanding/pause-stop-hide.html
[wcag-1-2-2]: https://www.w3.org/WAI/WCAG22/Understanding/captions-prerecorded.html
[wcag-2-5-8]: https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html
[wcag-4-1-2]: https://www.w3.org/WAI/WCAG22/Understanding/name-role-value.html
[wcag-4-1-3]: https://www.w3.org/WAI/WCAG22/Understanding/status-messages.html
[wcag-1-4-10]: https://www.w3.org/WAI/WCAG22/Understanding/reflow.html
[wcag-1-3-1]: https://www.w3.org/WAI/WCAG22/Understanding/info-and-relationships.html
[wcag-2-1-1]: https://www.w3.org/WAI/WCAG22/Understanding/keyboard.html
[wcag-2-4-3]: https://www.w3.org/WAI/WCAG22/Understanding/focus-order.html
[wcag-2-4-1]: https://www.w3.org/WAI/WCAG22/Understanding/bypass-blocks.html
[wcag-2-4-2]: https://www.w3.org/WAI/WCAG22/Understanding/page-titled.html
[wcag-3-3-1]: https://www.w3.org/WAI/WCAG22/Understanding/error-identification.html
[wcag-2-4-7]: https://www.w3.org/WAI/WCAG22/Understanding/focus-visible.html

## Full audit

When at all possible, use the guidelines in the basics and quick check sections
to attempt to address accessibility in a proactive way.

If a thorough analysis needs to be performed, use the following workflow to
perform a comprehensive accessibility audit that checks against most WCAG
criterion:

1. Create a copy of the [Accessibility Audit Template] spreadsheet in Google
Drive
1. Break apart the site or app to be audited into discrete user flow sections,
ordered by importance
1. Add yourself as the section lead on the audit template, document the relevant
URL and date, and set a status
1. For each user flow, identify each component that enables the user flow to
function
1. For each component, check against the test criteria for each row, and then
assign it one of four ratings:
   - **N/A**: This test does not apply to this component
   - **Pass**: This component meets this test's criteria
   - **Moderate**: This component does not meet this test's criteria, but can
     worked around
   - **Critical**: This component does not meet this test's criteria, and cannot
     be worked around
1. Once a component is completed, update its status
1. Continue until all user flows have been audited

Use the Notes sheet to leave per-cell comments when necessary, referencing them
with a link. The next steps for an audit are handled on a per-project basis.

[accessibility audit template]: https://www.fsb.org.uk/resources/article/accessibility-audit-template-MCTMWUV4Z27FEXRANM566TOZXNOE
[accesslint]: https://github.com/marketplace/accesslint
[axe]: https://www.deque.com/axe/axe-for-web/integrations/
[axe's browser extensions]: https://www.deque.com/axe/axe-for-web/
[minimum contrast ratio]: https://webaim.org/resources/linkcontrastchecker/
[manual usability testing]: https://www.smashingmagazine.com/2018/09/importance-manual-accessibility-testing/
[nvda]: https://a11yproject.com/posts/getting-started-with-nvda/
[accessibility insights]: https://accessibilityinsights.io
[simple and direct]: https://datayze.com/readability-analyzer.php
[vestibular and seizure triggers]: https://alistapart.com/article/designing-safer-web-animation-for-motion-sensitivity/
[voiceover]: https://a11yproject.com/posts/getting-started-with-voiceover/
[wave]: https://wave.webaim.org/extension/
[web content accessibility guideline (wcag)]: https://www.w3.org/WAI/standards-guidelines/wcag/
