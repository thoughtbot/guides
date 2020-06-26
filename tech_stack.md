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
* Use Apollo when consuming a GraphQL API.

### iOS (Native)

* Use Swift for writing native app code.
* Use Xcode and xcodebuild for building iOS apps.
* Use xcpretty to format xcodebuild output.
* Use Xcode automatic provisioning when possible.
* Use UIKit with Storyboards and MVVM for creating UIs.
* Use Dispatch and OperationQueue for concurrency.
* Support VoiceOver and VoiceControl for accessibility.
* Use Swift Package Manager for dependencies when possible.
* Manually test on both iPhone and iPad to ensure the app is functional.
* Work closely with designers on UI components.
* Prefer standard UIKit components to custom views.

We recommend learning at least one of the following:

* MapKit or Google Maps
* Core Location
* Core Bluetooth
* PhotoKit
* UserNotifications

### API

* Use GraphQL as an API layer when connecting a mobile app to a web service.

### Web

* Use Ruby on Rails for new applications.
* Use [Suspenders] to generate new Rails applications and as a reference for
  preferred library choices.
* Use Heroku with git deploys and pipelines for deploying applications.
* Use test-driven development to ensure quality.
* Use GitHub pull-requests to conduct peer code review.
* Use continuous integration to ensure tests continue to pass.
* Use a staging server to ensure new features work as expected before deploying
  to production.

[Suspenders]: https://github.com/thoughtbot/suspenders

### Storage

* Use Postgres to store most data.

### Messaging

* Use Kafka when producing and consuming messages between services.
* Use ruby-kafka by default when connecting to Kafka from Ruby applications.

### Data

* Use services in the same Rails application for building data pipelines on top
  of Kafka.
