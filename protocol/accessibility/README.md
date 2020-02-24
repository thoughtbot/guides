Accessibility
=============

A guide for auditing and maintaining accessible web sites and apps.

Basics
------

thoughtbot strives for AA level [Web Content Accessibility Guideline (WCAG)][wcag] compliance. Perform one or more of these checks to ensure your work is accessible. 

### Automation

Automated checks can catch a lot of common issues before they reach production.

* Use tools such as [WAVE][wave] or [axe's browser extensions][axe-web] to run audits on your local build
* Use a CI/CD solution such as [AccessLint][accesslint] or [axe][axe]

### Usability

Manual usability testing ensures things [work as intended][manual-testing].

* Test your local build using a screen reader such as [VoiceOver][voiceover] or [NVDA][nvda]
* Use tools such as [Accessibility Insights][accessibility-insights] to catch
  issues that cannot be found using automated checks
* Hire assistive technology users to user test your product

Quick checks
------------

### Design

* Ensure all content's foreground color values meet the [minimum contrast ratio][color-contrast] for the background color they are placed over
* Ensure all interactive content has distinct hover and focus states to help indicate interactivity
* Ensure color is not the only way to determine meaning
* Ensure interactive components use common UI affordances where applicable, to help users understand how they can be operated
* Prefer icons and glyphs that don't rely on specialized knowledge to understand their meaning, unless being used in a domain-specific context
* Prefer language that is [simple and direct][readability]
* Ensure form inputs have labels that are visible in every state
* Ensure link and button text is descriptive and distinct 
* Prefer content that is broken into logical sections, with headings that explain the content that follows
* Prefer text sizing that is set to 16px or larger
* Ensure animation does not auto-play, can be paused, and avoids [vestibular and seizure triggers][vestibular-seizure]
* Ensure video content has captions
* Prefer larger interactive target sizes, with some space between grouped interactive controls

### Development 

* Ensure semantic markup is used to describe content
* Ensure content does not disappear off the screen when zoomed
* Ensure that interactive content can be tabbed to and activated using the keyboard, and that the tab order matches reading order
* Ensure that heading elements are used, and that heading levels are placed in a logical order
* Ensure that landmarks are used to describe the overall layout of the page or view
* Ensure that alternative descriptions for image content are concise, descriptive, and use punctuation (`alt` attributes for images, `title` elements for SVGs)
* Ensure labels are programmatically associated with their inputs
* Prefer implementing a method to allow users to skip sections of repeated content
* Ensure each page or view has a unique title that describes the content it contains
* The `title` attribute is only used to describe `iframe` element contents
* Ensure that links are used to navigate to other locations and buttons are used to trigger actions
* Ensure that focus is trapped inside of modal interactions
* Ensure `fieldset` and `legend` elements are used to group related inputs and label them
* Ensure form feedback messaging is programmatically associated with the relevant inputs

Full audit
----------

When at all possible, use the guidelines in the basics and quick check sections to attempt to address accessibility in a proactive way. 

If a thorough analysis needs to be performed, use the following workflow to perform a comprehensive accessibility audit that checks against most WCAG criterion:

1. Create a copy of [the Accessibility Audit Template][accessibility-audit-template] spreadsheet in Google Drive
1. Break apart the site or app to be audited into discrete user flow sections, ordered by importance
1. Add yourself as the section lead on the audit template, document the relevant URL and date, and set a status
1. For each user flow, identify each component that enables the user flow to function
1. For each component, check against the test criteria for each row, and then assign it one of four ratings:
    * **N/A**: This test does not apply to this component
    * **Pass**: This component meets this test's criteria
    * **Moderate**: This component does not meet this test's criteria, but can worked around
    * **Critical**: This component does not meet this test's criteria, and cannot be worked around
1. Once a component is completed, update its status
1. Continue until all user flows have been audited

Use the Notes sheet to leave per-cell comments when necessary, referencing them with a link. The next steps for an audit are handled on a per-project basis. 

[accessibility-audit-template]: https://docs.google.com/spreadsheets/d/1Ys-0U5BY-Ct_phy7gk9XJmn4nBTMFTh08aTQ6U1kB_4/edit?usp=sharing
[accesslint]: https://github.com/marketplace/accesslint
[axe]: https://www.deque.com/axe/axe-for-web/integrations/
[axe-web]: https://www.deque.com/axe/axe-for-web/
[color-contrast]: https://webaim.org/resources/linkcontrastchecker/
[manual-testing]: https://www.smashingmagazine.com/2018/09/importance-manual-accessibility-testing/
[nvda]: https://a11yproject.com/posts/getting-started-with-nvda/
[accessibility-insights]: https://accessibilityinsights.io
[readability]: https://datayze.com/readability-analyzer.php
[vestibular-seizure]: https://alistapart.com/article/designing-safer-web-animation-for-motion-sensitivity/
[voiceover]: https://a11yproject.com/posts/getting-started-with-voiceover/
[wave]: https://wave.webaim.org/extension/
[wcag]: https://www.w3.org/WAI/standards-guidelines/wcag/
