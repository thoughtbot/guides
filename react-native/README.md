# React Native

- Use React following the [React Guide](/react/)
- Use [TypeScript](/typescript/)
- Prefer using [core components and apis] over writing bespoke components.

[core components and apis]: https://reactnative.dev/docs/components-and-apis

## Tooling

* Start new projects with [create-belt-app](https://www.npmjs.com/package/create-belt-app)
* Use [Expo](https://expo.dev)
* Use [Expo EAS](https://expo.dev/eas) for continuous deployment
* Use [Expo Secure Store](https://docs.expo.dev/versions/latest/sdk/securestore/) for storing sensitive data like auth and refresh tokens
* Use [React Navigation](https://reactnavigation.org/) for routing
* Use [TanStack React Query](https://tanstack.com/query/v4/docs/framework/react/overview) as an API client for REST APIs
* Use [Apollo Client](https://www.apollographql.com/docs/react/) as an API client for GraphQL APIs
* Use [Zustand](https://github.com/pmndrs/zustand) for global state
  * Avoid storing API data in a global store. Instead, use a dedicated API client.
* Use [React Native Firebase](https://rnfirebase.io/) for push notifications
* Use [Sentry](https://docs.sentry.io/platforms/react-native/) for error reporting
* Prefer [RevenueCat](https://www.revenuecat.com/) for in-app payments
  * If RevenueCat pricing is not acceptable since it collects a percentage of revenue, use [react-native-iap](https://react-native-iap.dooboolab.com/docs/get-started/)

## Style

- Prefer using [StyleSheets]
- Prefer [organized and composable styles]
- Avoid designing for only one platform.
- Avoid designing for only one screen size.
- Prefer common mobile patterns and avoid [non-standard patterns].

[StyleSheets]: https://reactnative.dev/docs/stylesheet
[organized and composable styles]: https://thoughtbot.com/blog/structure-for-styling-in-react-native
[non-standard patterns]: https://thoughtbot.com/blog/some-tips-for-designing-apps-in-react-native#make-it-feel-native-even-though-it39s-not

## Testing

- Test using React Native [Testing Library](https://callstack.github.io/react-native-testing-library/) and [Jest](https://jestjs.io/)
- Mock API calls in tests using [MSW](https://mswjs.io/). If using Apollo Client, mock using the built-in `MockedProvider`
- Prefer testing on physical devices.
- Use [detox] for integration tests.

[detox]: https://github.com/wix/Detox

