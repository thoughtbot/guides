代码审查
===========

审查别人的代码以及接受自己的代码被别人审查

每个人都该知道的
--------

* Accept that many programming decisions are opinions. Discuss tradeoffs, which
  you prefer, and reach a resolution quickly.
* 提问，而不是提要求。（“你觉得`:user_id`这个命名怎么样？”）
* 对于不清楚的地方，请求阐述。
  ("我不太理解这个地方，你能给我阐述清楚吗？")
* 避免选择代码所有权。 ("我的", "不是我的", "你们的")
* 避免使用可能被看作个人特征的词语 ("哑巴","愚蠢")。假设我们每个人都是有吸引力，聪明和充满善意的。
* 直言不讳。记住别人并不会总是能理解你的意思。
* 要谦虚。（“我不太确定 - 让我们一起来看看它”）
* 不要使用太夸张的词。 ("总是", "从来不", "永久的", "决不")
* 不要嘲讽。
* 保持真实. If emoji, animated gifs, or humor aren't you, don't force them.
  If they are, use them with aplomb.
* 和那些回复太多“我不太理解”或者“有一个替代解决方案”的人在线下好好谈谈，然后再把谈话内容做个总结回复到线上。

当自己的代码被别人审查
-------------------------

* 感谢审查者的意见。 ("很好的要求，我会做出这样的改变。")
* 不要往心里去，审查的是代码，而不是你这个人。
* 解释代码为什么存在。（“是这样的，如果我重新改变这些类/文件/方法/变量的名字，可能会更易读”） 
* Extract some changes and refactorings into future tickets/stories.
* Link to the code review from the ticket/story. ("Ready for review:
  https://github.com/organization/project/pull/1")
* Push commits based on earlier rounds of feedback as isolated commits to the
  branch. Do not squash until the branch is ready to merge. Reviewers should be
  able to read individual updates based on their earlier feedback.
* Seek to understand the reviewer's perspective.
* Try to respond to every comment.
* Wait to merge the branch until another person signs off.
* Wait to merge the branch until Continuous Integration (TDDium, TravisCI, etc.)
  tells you the test suite is green in the branch.

Reviewing code
--------------

Understand why the code is necessary (bug, user experience, refactoring). Then:

* Communicate which ideas you feel strongly about and those you don't.
* Identify ways to simplify the code while still solving the problem.
* If discussions turn too philosophical or academic, move the discussion offline
  to a regular Friday afternoon technique discussion. In the meantime, let the
  author make the final decision on alternative implementations.
* Offer alternative implementations, but assume the author already considered
  them. ("What do you think about using a custom validator here?")
* Seek to understand the author's perspective.
* Sign off on the pull request with a :thumbsup: or "Ready to merge" comment.

Style comments
--------------

Reviewers should comment on missed [style](../style)
guidelines. Example comment:

    [Style](../style):

    > Order resourceful routes alphabetically by name.

An example response to style comments:

    Whoops. Good catch, thanks. Fixed in a4994ec.

If you disagree with a guideline, open an issue on the guides repo rather than
debating it within the code review. In the meantime, apply the guideline.

Ruby on Rails review
--------------------

* Review data integrity closely, such as migrations that make irreversible
  changes to the data, and whether there is a related todo to make a database
  backup during the staging and production deploys.
* Review SQL queries for potential SQL injection.
* Review whether dependency upgrades include a reason in the commit message,
  such as a link to the dependency's `ChangeLog` or `NEWS` file.
* Review whether new database indexes are necessary if new columns or SQL
  queries were added.
* Review whether new scheduler (`cron`) tasks have been added and whether there
  is a related todo in the project management system to add it during the
  staging and production deploys.
