Code Review
===========

A guide for reviewing code with a light-hearted and respect attitude.

Read more about the process of reviewing code, in context of writing a feature
or fixing a bug, in the [Protocol](/thoughtbot/guides/blob/master/protocol)
guide.

Everyone
--------

* Accept that many programming decisions are opinions.
* Ask questions; don't make demands. ("What do you think about naming this
  `:user_id`?")
* Ask for clarification. ("I didn't understand. Can you clarify?")
* Avoid selective ownership of code. ("mine", "not mine", "yours")
* Avoid using terms that could be seen as referring to personal traits. ("dumb",
  "stupid") Assume everyone is handsome, intelligent, and well-meaning.
* Be humble. ("I'm not sure - let's look it up.")
* Don't use hyperbole. ("always", "never", "endlessly", "nothing")
* Don't use sarcasm.
* Keep it real. If emoji, animated gifs, or humor aren't you, don't force them.
  If they are, use them with aplomb.
* Reach resolutions quickly.
* Talk in person if there are too many "I didn't understand" or "Alternative
  solution:" comments. Post a follow-up comment summarizing offline discussion.

Author of code for review
-------------------------

* Be grateful for the reviewer's suggestions. ("Good call. I'll make that
  change.")
* Don't take it personally. The review is of the code, not you.
* Explain the reasons code exists for which the reviewer asked for
  clarification. ("It's like that because of these reasons. How about I rename
  this class/file/method/variable to make those reasons more clear?")
* Extract some changes and refactorings into future tickets/stories.
* Link to the code review from the ticket/story. ("Ready for review:
  http://github.com/organization/project/pull/1")
* Seek to understand the reviewer's perspective.
* Push commits based on earlier rounds of feedback as isolated commits to the
  branch. Do not squash until the branch is ready to merge. Reviewers should be
  able to read individual updates based on their earlier feedback.

Code reviewer
-------------

First, make sure you understand why the code is necessary (fixes a bug, improves
the user experience, or is better engineering). Then:

* Differentiate between ideas you feel strongly about and those you don't.
* Don't block code for academic reasons. Object-oriented design and other topics
  should be part of a regularly-scheduled Friday afternoon technique discussion,
  not code review.
* Explain tradeoffs of implementation and why you prefer the tradeoffs as
  written.
* Identify ways to simplify the code while still solving the problem.
* Offer alternative implementations, but assume the author already considered
  them. ("What do you think about using a custom validator here?")
* Seek to understand the author's perspective.

Style comments
--------------

Reviewers should comment on missed [style](/thoughtbot/guides/blob/master/style)
guidelines. Example comment:

    [Style](/thoughtbot/guides/blob/master/style):

    > Order resourceful routes alphabetically by name.

The style guidelines are not optional. They have been agreed to as a team,
intended to improve readability, consistency, and save time discussing style.

An example response to style comments:

    Whoops. Good catch, thanks. Fixed in a4994ec.

If you disagree with a style guideline, the code review is not the place to
discuss it. Open an issue on the style guide repo. In the meantime, apply the
guideline to the codebase.
