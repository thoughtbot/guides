# Code Review

A guide for reviewing code and having your code reviewed.

Watch a presentation that covers this material from [Derek Prior at RailsConf 2015](https://www.youtube.com/watch?v=PJjmw9TRB7s).

## Everyone

- **Accept that many programming decisions are opinions**
  - Discuss tradeoffs, which you prefer, and reach a resolution quickly.

- **Ask good questions; don't make demands**
  - "What do you think about naming this `:user_id`?"

- **Good questions avoid judgment and avoid assumptions about the author's
  perspective**
- **Ask for clarification**
  - "I didn't understand. Can you clarify?"

- **Avoid selective ownership of code**
  - "Mine", "not mine", "yours"

- **Avoid using terms that could be seen as referring to personal traits**
  - "Dumb", "stupid".
  - Assume everyone is intelligent and well-meaning.

- **Avoid diminishing words**
  - "simply", "simple", "just"

- **Be explicit**
  - Remember people don't always understand your intentions online.

- **Be humble**
  - "I'm not sure - let's look it up."

- **Don't use hyperbole**
  - "Always", "never", "endlessly", "nothing"

- **Don't use sarcasm**
- **Keep it real**
  - If emoji, animated gifs, or humor aren't you, don't force them.
  - If they are, use them with aplomb.

- **Talk synchronously if there are too many "I didn't understand" or "Alternative solution:" comments**
  - Chat, screen-sharing, in person
  - Post a follow-up comment summarizing the discussion.

- **If you learned something new, share your appreciation**
  - "I did not know about this. Thank you for sharing it."

- **Avoid the "since you're at it" attitude**
  - If you would like to recommend a code change unrelated to the current
  pull request, suggest it in the appropriate place or open a ticket for it
  (on Trello, JIRA, GitHub project...)

## Having Your Code Reviewed

- **Be grateful for the reviewer's suggestions**
  - "Good call. I'll make that change."

- **Be aware that it can be [challenging to convey emotion and intention online]**
  - You may want to consider [using labels] to convey intention and tone.

- **Explain why the code exists**
  - "It's like that because of these reasons. Would it be more clear if I rename this class/file/method/variable?"

- **Extract some changes and refactoring into future tickets/stories**
- **When making visual changes, include screenshots or screencasts to show the effect of the changes**
  - You may want to consider before/after screenshots or screencasts whenever applicable.

- **Link to the code review from the ticket/story**
  - "Ready for review: `https://github.com/organization/project/pull/1`

- **Push commits based on earlier rounds of feedback as isolated commits to the branch**
  - Do not squash until the branch is ready to merge.
  - Reviewers should be able to read individual updates based on their earlier feedback.

- **Seek to understand the reviewer's perspective**
- **Try to respond to every comment**
- **Wait to merge the branch until continuous integration tells you the test suite is green in the branch**
  - TDDium, Travis CI, CircleCI, GitHub Actions, etc.

- **Merge once you feel confident in the code and its impact on the project**
- **Final editorial control rests with the pull request author**

- **Recognize the work of your teammates when you are pairing**
  - Use `Co-Authored-By: <name> <email>` at the end of your commit message.

## Reviewing Code

Understand why the change is necessary (fixes a bug, improves the user experience, refactors the existing code).

Then:

- **Communicate which ideas you feel strongly about and those you don't**
- **Identify ways to simplify the code while still solving the problem**
- **If discussions turn too philosophical or academic, move the discussion offline to a regular Friday afternoon technique discussion**
  - In the meantime, let the author make the final decision on alternative implementations.

- **Offer alternative implementations**
  - But assume the author already considered them.
  - "What do you think about using a custom validator here?"

- **Seek to understand the author's perspective**
- **Approve the pull request**
- **Remember that you are here to provide feedback, not to be a gatekeeper**
- When suggesting changes using the "Add a suggestion" feature:
  - **Communicate clearly which lines you suggest adding/removing**
  - **Test the suggested changes to validate it works whenever possible**
  - **When not possible, let the pull request author know that you did not test the suggestion**
  - **Provide some context to let the author know why you're suggesting the change**

## Style Comments

Reviewers should comment on missed style guidelines. Example comment:

    > Order resourceful routes alphabetically by name.

An example response to style comments:

    Whoops. Good catch, thanks. Fixed in a4994ec.

If you disagree with a guideline, open an issue on the guides repo rather than debating it within the code review. In the meantime, apply the guideline. It's often helpful to set up a linter like [standard] to format code automatically.

This helps us have more meaningful conversations on PRs rather than debating personal style preferences.

- **Leave one comment only, for multiple stylistic offenses of the same kind**
  - If there are a few occurrences of the same change needed, do not
  leave multiple comments for the same change, rather suggest running the linter,
  and/or leave one comment only, mentioning the line and elsewhere,
  as long as the other files are being edited in the pull request.

[challenging to convey emotion and intention online]: https://thoughtbot.com/blog/empathy-online
[using labels]: https://conventionalcomments.org
[standard]: https://github.com/testdouble/standard
