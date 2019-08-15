# GraphQL

A guide for building GraphQL servers and clients.


## Learning

A curated list of resources for learning GraphQL.

- **[Official GraphQL Learning Site](https://graphql.org/learn/)**
- **[How To GraphQL](https://www.howtographql.com/)** Online tutorial for both
  server and client GraphQL in multiple programming languages.
- **[Learning GraphQL](http://shop.oreilly.com/product/0636920137269.do)** A
  clear introduction to GraphQL technology and a walk through of building a
  GraphQL server.
- **[GraphQL: A Query Language for your
  API](https://www.dropbox.com/s/svqe68hpdiixf0g/presentation.pdf?dl=0)**
  Presentation introducing GraphQL to thoughtbot.

## Public GraphQL APIs

Publicly available GraphQL APIs allowing you to explore how GraphQL is and can
be used.

- **[GitHub GraphQL API Explorer](https://developer.github.com/v4/explorer/)**
- **[Star Wars GraphQL](https://graphql.org/swapi-graphql/)**

## Tools

- **[GraphiQL](https://github.com/graphql/graphiql).** An Electron-based "web
  IDE" for interacting with GraphQL APIs. GraphiQL can also be served as a page
  in an application.
- **[GraphQL Playground](https://github.com/prisma/graphql-playground)** An
  Electron-based "web IDE" for interacting with GraphQL APIs. Intends to expand
  upon GraphiQL.
- **[Insomnia](https://insomnia.rest/)** An HTTP client with solid GraphQL
  support.
- **[Apollo Client Dev
  Tools](https://www.apollographql.com/docs/react/features/developer-tooling)**
  Chrome Extension offering developer tools for Apollo projects.

## Best Practices

* Follow the latest version of the [GraphQL specification].
* When serving over HTTP, respond with a 200 OK status code to all GraphQL
  queries.
* If a client or server error occurs, use the `errors` key in the GraphQL
  response.
* If a user-facing error occurs (such as invalid user input), use the `data` key
  in the GraphQL response.
* If a mutation can fail because of a user error, use a union type to describe
  the possible outcomes.
* If there is an authenticated user, provide the user in the context for the
  resolver.
* Provide the updated object as a field in mutations.
* Provide the ID of the deleted object as a field in mutations that delete
  objects.
* Use JSON as a default transport format.

[GraphQL specification]: https://graphql.github.io/graphql-spec/
