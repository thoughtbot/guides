Product management process with Trello
======================================

The product management process with [Trello](http://trello.com) spans multiple
Trello boards:

* Product Roadmap
* Bugs
* Product Design
* Engineering & Refactoring
* Current

![Current](http://f.cl.ly/items/3H3i1M0Q1G1s2V3I433S/Screen%20Shot%202013-02-25%20at%209.08.22%20AM.png)

The goal of the Product Roadmap board is to provide a potential long-term vision
for the product and organize major features, marketing initiatives, and other
milestones.

The goal of the Product Design board is to keep the team focused on solving
problems and thinking from the user's perspective.

The goal of the Bugs board is to keep track of bugs that are out of scope for
the current week.

The goal of the Engineering & Refactoring board is to keep track of bugs that
are out of scope for the current week.

Cards from Product Design, Bugs, Engineering boards are pulled into the
Next Up list on the Current board as described in the "Weekly Product Meeting"
section below.

The Next Up list is the single prioritized list that the product team
(designers and developers) refer to in order to know what to work on next.

Trello cards
------------

A card represents a single user story, bug fix, engineering task, or general
todo.

Cards start out as a simple idea, 1-2 sentences long. As they are pulled through
boards, detail is added, explaining why (from a business perspective)
we're focusing on it, and maybe notes on suggested implementation (though
designers and developers may take or leave it at their discretion; it's supposed
to be helpful, not prescriptive).

Product Roadmap
---------------

The cards on this board are the major projects to be completed. In agile terms,
they are called "epics." They are not directly moved to other lists but do
inform cards in Product Design and Refactoring & Engineering lists.

Organize the cards into lists named by the expected month they'll be addressed.

Bugs
----

The cards on this board are bugs in the described state. There are multiple
lists on this board:

* Reported
* Needs Clarification
* Ready for Next Up

If a bug is labeled Critical, then it is pulled immediately into Next Up. If the
bug is not critical, it stays in Bugs until the next product meeting.

A bug has steps to reproduce the bug and optionally a screencast.

Product Design
--------------

The cards on this board lists are the result of sketching user flows, usability
tests, other user research, or the designer's feel for visual design
improvements. There are multiple lists on this board:

* Next Up
* User Stories
* User Experience
* Ready for Next Up

Engineering & Refactoring
-------------------------

The cards on this board are refactorings and other engineering tasks necessary
to fix bugs or improve the user experience. "Response time" is a primary user
experience goal on every app. There are multiple lists on this board:

* Reported
* Needs Clarification
* Ready for Next Up

If an engineering task is labeled Critical, then it is pulled immediately to
Next Up. If the task is not critical, it stays in Refactoring & Engineering
until the next product meeting.

Weekly Product Meeting (1-2 hours)
----------------------------------

On Friday (or Thursday if that's the end of the team's week) afternoon, the
product manager, designer, and lead developer meet in person or via Google
Hangout. They load the product on a screen, focus on recent changes to it, and
use the working app and Trello boards to plan the upcoming week's iteration. The
product manager runs the meeting like this:

* Review the Product Roadmap board. The product manager shows the current state
  of the roadmap and provides insight into what these cards are and why they're
  a priority (the business case).
* Review the Product Design board. Pull what we estimate to be an appropriate
  amount for this week into Next Up.
* Re-sort the entire Next Up queue according to priority. Cards that were at the
  top of the list last week may be moved to the bottom or back to the Product
  Design, Bugs, or Engineering & Refactoring boards.
* Review the Bugs board. Pull any important bugs into Next Up and prioritize
  then at the top of the queue before everything else. We want to always be
  fixing what's broken first.
* Review the Engineering & Refactoring board. Pull cards into Next Up based on
  what the designers and developers believe is appropriate given the previously
  stated Product Roadmap, Product Design, and Bugs.

Weekly Planning Meeting (30 minutes)
------------------------------------

On Monday morning, everyone meets in-person or via Google Hangout.

The goal is to make sure everyone knows what's going on with the product and to
celebrate the work of team members. The product manager runs this meeting like
this:

* Review the cards that went live last week, taking 30 seconds to describe each
  card, and congratulate those who worked on them, showing their avatar.
* Review the cards in Next Up. Clarify any questions about them.

Building and Shipping
---------------------

![Shipping](http://f.cl.ly/items/2h2d2Z1z0X3s0n3d3y0R/Screen%20Shot%202012-12-02%20at%2010.03.44%20AM.png)

The cards in the Next Up list are prioritized, vetted, and ready for design &
development. A designer or developer "puts their face on it" by assigning it to
themselves and pulling it into the In Progress list.

Designers and developers may pull any card out of Next Up that they feel they
can handle, but should consider the cards are prioritized by importance.

The cards in the In Progress list are actively being designed or developed.
Etiquette is that you should never have your face on more than two cards at a
time. Work is done in a [feature branch](/protocol).

When a designer or developer creates a pull request for their feature branch,
they move the card to the Code Review list. Any reviewers "put their face on it"
while reviewing.

There is no central chokepoint for merging into master: everyone can do it.

The cards in the Testing on Staging (or Testing on Ad Hoc build for iPhone apps)
list are deployed to staging (or distributed via TestFlight for iPhone apps).
The card creator and a designer review it for accuracy and user experience.

There is no central chokepoint for deploying to staging: everyone can do it.

The cards in the Ready for Production list include cards that have been accepted
on staging and are ready to be deployed (but not necessarily rolled out).

There is no central chokepoint for releasing to production: everyone can do it.

The cards in the Live (Week [date]) lists have been released. Each week has its
own Live list so we can follow what got released when.
