# GraphQL

A guide for building GraphQL servers and clients.

## Learning

A curated list of resources for learning GraphQL.

- **[Official GraphQL Learning Site]**
- **[How To GraphQL]** Online tutorial for both server and client GraphQL in
  multiple programming languages.
- **[Learning GraphQL]** A clear introduction to GraphQL technology and a walk
  through of building a GraphQL server.
- **[GraphQL: A Query Language for your API]** Presentation introducing GraphQL
  to thoughtbot.

[official graphql learning site]: https://graphql.org/learn/
[how to graphql]: https://www.howtographql.com/
[learning graphql]: http://shop.oreilly.com/product/0636920137269.do
[graphql: a query language for your api]: https://www.dropbox.com/s/svqe68hpdiixf0g/presentation.pdf?dl=0

## Public GraphQL APIs

Publicly available GraphQL APIs allowing you to explore how GraphQL is and can
be used.

- **[GitHub GraphQL API Explorer]**
- **[Star Wars GraphQL]**

[github graphql api explorer]: https://developer.github.com/v4/explorer/
[star wars graphql]: https://graphql.org/swapi-graphql/

## Tools

- **[GraphiQL].** An Electron-based "web IDE" for interacting with GraphQL APIs.
  GraphiQL can also be served as a page in an application.
- **[GraphQL Playground]** An Electron-based "web IDE" for interacting with
  GraphQL APIs. Intends to expand upon GraphiQL.
- **[Insomnia]** An HTTP client with solid GraphQL support.
- **[Apollo Client Dev Tools]** Chrome Extension offering developer tools for
  Apollo projects.

[graphiql]: https://github.com/graphql/graphiql
[graphql playground]: https://github.com/prisma/graphql-playground
[insomnia]: https://insomnia.rest/
[apollo client dev tools]: https://www.apollographql.com/docs/react/features/developer-tooling

## Best Practices

- Follow the latest version of the [GraphQL specification].
- When serving over HTTP, respond with a 200 OK status code to all GraphQL
  queries.
- If a client or server error occurs, use the `errors` key in the GraphQL
  response.
- If a user-facing error occurs (such as invalid user input), use the `data` key
  in the GraphQL response.
- If a mutation can fail because of a user error, use a union type to describe
  the possible outcomes.
- If there is an authenticated user, provide the user in the context for the
  resolver.
- Provide the updated object as a field in mutations.
- Provide the ID of the deleted object as a field in mutations that delete
  objects.
- Use JSON as a default transport format.
- Avoid returning null from operations. [#630]

[graphql specification]: https://graphql.github.io/graphql-spec/
[#630]: https://github.com/thoughtbot/guides/pull/630
