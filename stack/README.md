# thoughtbot Stack

We have a standard technology stack that we use for each new project by default.
This provides a proven base for rapid, quality development and ensures we have a
large team of developers ready to jump on new projects using a known technology.
It helps to avoid decision fatigue at the beginning of each project.

We deviate from this stack when we find something new that we need to evaluate.
This allows us to practice our value of [Continuous Improvement].

We will also swap in alternate technology as necessary when our default stack is
inappropriate for the task at hand. This allows us to practice our value of
[Quality].

[Continuous Improvement]: https://thoughtbot.com/purpose#continuous-improvement
[Quality]: https://thoughtbot.com/purpose#quality

## Layers

Our stack is broken up into layers. Each layer depends on another layer. This
allows us to swap out an entire layer when necessary without losing all the
decisions made for other layers.

### UI

#### Web

* Use server-rendered HTML when possible as a UI layer.

### Android (Native)

* Use Kotlin for writing native app code.
* Use Gradle with Android Studio for building.
* Use MVVM to model views.

### API

* Use GraphQL as an API layer when connecting a mobile app to a web service.

### Web

* Use Ruby on Rails for new applications.
* Use Heroku with git deploys and pipelines for deploying applications.
* Use test-driven development to ensure quality.
* Use GitHub pull-requests to conduct peer code review.
* Use continuous integration to ensure tests continue to pass.
* Use a staging server to ensure new features work as expected before deploying
  to production.

### Storage

* Use Postgres to store most data.
