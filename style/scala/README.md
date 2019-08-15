# Scala

* Avoid `var`.
* Avoid implicit conversions.
* Avoid wildcard imports except for implicits.
* Avoid `null` except when necessary for Java compatibility.
* Prefer a lazy effect type like `cats.effect.IO` to `scala.concurrent.Future`.
* Use [scalafmt] to automatically format as much as possible.

[scalafmt]: https://scalameta.org/scalafmt/
