# Use an opinionated set of rules for Rubocop

Ruby code can be written in many different styles and still be syntactically correct. The presence of divergent style and
format can disrupt communication as well as complicate feature development. Code that exhibits a consistent style is
easier to understand and maintain. The absence of consistent enforced style can result in unnecessary code churn.

**Therefore:** Use an opinionated set of rules for Rubocop when coding in Ruby.

- Prefer [standard] for new projects.
- By employing an already decided configuration, you avoid bikeshedding on what the Rubocop configuration should be.
- Code that is consistently formatted and styled will be easier to work with.

There are, however, a few reasons one might choose not to introduce Standard in a project:

- Change for the sake of change can be disruptive
- An existing project may already employ it's own opinionated configuration of Rubocop and that set of rules is working.
- A large project, which does not already use Standard, might require a costly amount of time to refactor and retrofit
  existing code to conform to a new set of conventions.
- There exists a need or desire to use Cops which are disabled by Standard
- [standard] presents a lightweight but sensible set of style rules to focus on coding
- [standard] prevents you from using cops that it disables

Overall, the goal is to increase the quality and consistency of code while not getting distracted by disproportionally
minor or trivial details. It's more important for an implementation team to agree to follow shared conventions than it
is to enforce a specific configuration.

[standard]: https://github.com/testdouble/standard
