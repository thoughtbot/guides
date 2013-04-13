Product management process with Trello
======================================

A Trello board is a software equivalent of a physical wall with columns of
sticky notes. In Trello terminology, the wall is called a "board." The columns
are called "lists." The sticky notes in columns are called "cards."

No two products are the same, so flexibility in the product management process
is important. Trello responds well to changing the structure of the process
"on the fly."

Our product management process with [Trello](http://trello.com) can span multiple
Trello boards:

* Bugs
* Product Design
* Engineering & Refactoring
* Current

![Current](http://f.cl.ly/items/3H3i1M0Q1G1s2V3I433S/Screen%20Shot%202013-02-25%20at%209.08.22%20AM.png)

"Current" is an example of a board. "In Progress" is an example of a list. "Set
up Splunk for logging" is an example of a card.

Cards from Product Design, Bugs, Engineering boards are pulled into the Next Up
list on the Current board as described in the "Weekly Product Meeting" section
below.

The Next Up list is the single prioritized list to which the product team
refers in order to know what to work on next. It represents one week of work.

Trello cards
------------

A card represents a single user story, bug fix, engineering task, or general
todo.

Cards start out as a simple idea, 1-2 sentences long. As they are pulled through
boards, detail is added, explaining why (from a business perspective)
we're focusing on it, and maybe notes on suggested implementation (though
designers and developers may take or leave it at their discretion; it's supposed
to be helpful, not prescriptive).

Bugs
----

The cards on this board are bugs in the described state. There are multiple
lists on this board:

* Reported
* Needs Clarification
* Ready for Next Up

If a bug is labeled Critical, then it is pulled immediately into Next Up. If the
bug is not critical, it stays in Bugs until the next product meeting.

A bug has steps to reproduce the bug and optionally a screenshot or screencast.

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

* Archive the two-week old "Live (Week of [date])" list.
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
  stated Product Design, and Bugs.

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

The cards in the Live (Week of [date]) lists have been released. Each week has
its own Live list so we can follow what got released when.
