part of '../route_tree.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const String path = '/';
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: const SplashView());
  }
}

@TypedGoRoute<DocumentReaderRoute>(path: DocumentReaderRoute.path)
class DocumentReaderRoute extends GoRouteData {
  const DocumentReaderRoute(this.$extra);
  static const String path = '/documentReader';
  final DocumentModel $extra;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: DocumentReaderView(document: $extra));
  }
}

@TypedGoRoute<UserProfileRoute>(path: UserProfileRoute.path)
class UserProfileRoute extends GoRouteData {
  const UserProfileRoute({required this.uid});
  static const String path = '/userProfile';
  final String uid;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: ProfileView(userId: uid));
  }
}

@TypedGoRoute<UserProfileEditRoute>(path: UserProfileEditRoute.path)
class UserProfileEditRoute extends GoRouteData {
  const UserProfileEditRoute(this.$extra);
  static const String path = '/userProfile/edit';
  final UserModel $extra;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: ProfileEditView(user: $extra));
  }
}

@TypedGoRoute<FeedUnvotedListRoute>(path: FeedUnvotedListRoute.path)
class FeedUnvotedListRoute extends GoRouteData {
  const FeedUnvotedListRoute(this.$extra);
  static const String path = '/feed/unvoted';
  final List<PollModel> $extra;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: FeedUnvotedList(unvotedList: $extra));
  }
}
