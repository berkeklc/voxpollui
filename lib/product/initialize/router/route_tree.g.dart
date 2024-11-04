// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_tree.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $registerRoute,
      $onboardRoute,
      $communityCreateRoute,
      $communityDetailRoute,
      $communityEditRoute,
      $communityMembersRoute,
      $homeShellRoute,
      $pollCreateRoute,
      $pollDetailsRoute,
      $splashRoute,
      $documentReaderRoute,
      $userProfileRoute,
      $userProfileEditRoute,
      $feedUnvotedListRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/auth/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/auth/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
      path: '/auth/register',
      factory: $RegisterRouteExtension._fromState,
    );

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute(
        state.extra as UserModel,
      );

  String get location => GoRouteData.$location(
        '/auth/register',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $onboardRoute => GoRouteData.$route(
      path: '/onboard',
      factory: $OnboardRouteExtension._fromState,
    );

extension $OnboardRouteExtension on OnboardRoute {
  static OnboardRoute _fromState(GoRouterState state) => const OnboardRoute();

  String get location => GoRouteData.$location(
        '/onboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $communityCreateRoute => GoRouteData.$route(
      path: '/community/create',
      factory: $CommunityCreateRouteExtension._fromState,
    );

extension $CommunityCreateRouteExtension on CommunityCreateRoute {
  static CommunityCreateRoute _fromState(GoRouterState state) =>
      const CommunityCreateRoute();

  String get location => GoRouteData.$location(
        '/community/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $communityDetailRoute => GoRouteData.$route(
      path: '/community/detail',
      factory: $CommunityDetailRouteExtension._fromState,
    );

extension $CommunityDetailRouteExtension on CommunityDetailRoute {
  static CommunityDetailRoute _fromState(GoRouterState state) =>
      CommunityDetailRoute(
        state.uri.queryParameters['community-id']!,
      );

  String get location => GoRouteData.$location(
        '/community/detail',
        queryParams: {
          'community-id': communityId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $communityEditRoute => GoRouteData.$route(
      path: '/community/edit',
      factory: $CommunityEditRouteExtension._fromState,
    );

extension $CommunityEditRouteExtension on CommunityEditRoute {
  static CommunityEditRoute _fromState(GoRouterState state) =>
      CommunityEditRoute(
        state.extra as CommunityModel,
      );

  String get location => GoRouteData.$location(
        '/community/edit',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $communityMembersRoute => GoRouteData.$route(
      path: '/community/members',
      factory: $CommunityMembersRouteExtension._fromState,
    );

extension $CommunityMembersRouteExtension on CommunityMembersRoute {
  static CommunityMembersRoute _fromState(GoRouterState state) =>
      CommunityMembersRoute(
        state.extra as CommunityModel,
      );

  String get location => GoRouteData.$location(
        '/community/members',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $homeShellRoute => ShellRouteData.$route(
      navigatorKey: HomeShellRoute.$navigatorKey,
      factory: $HomeShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home/feed',
          parentNavigatorKey: FeedRoute.$parentNavigatorKey,
          factory: $FeedRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home/discover',
          parentNavigatorKey: DiscoverRoute.$parentNavigatorKey,
          factory: $DiscoverRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home/myProfile',
          parentNavigatorKey: MyProfileRoute.$parentNavigatorKey,
          factory: $MyProfileRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home/community',
          parentNavigatorKey: CommunityRoute.$parentNavigatorKey,
          factory: $CommunityRouteExtension._fromState,
        ),
      ],
    );

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) =>
      const HomeShellRoute();
}

extension $FeedRouteExtension on FeedRoute {
  static FeedRoute _fromState(GoRouterState state) => const FeedRoute();

  String get location => GoRouteData.$location(
        '/home/feed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DiscoverRouteExtension on DiscoverRoute {
  static DiscoverRoute _fromState(GoRouterState state) => const DiscoverRoute();

  String get location => GoRouteData.$location(
        '/home/discover',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyProfileRouteExtension on MyProfileRoute {
  static MyProfileRoute _fromState(GoRouterState state) => MyProfileRoute(
        state.extra as String,
      );

  String get location => GoRouteData.$location(
        '/home/myProfile',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CommunityRouteExtension on CommunityRoute {
  static CommunityRoute _fromState(GoRouterState state) =>
      const CommunityRoute();

  String get location => GoRouteData.$location(
        '/home/community',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pollCreateRoute => GoRouteData.$route(
      path: '/poll/create',
      factory: $PollCreateRouteExtension._fromState,
    );

extension $PollCreateRouteExtension on PollCreateRoute {
  static PollCreateRoute _fromState(GoRouterState state) => PollCreateRoute(
        ownerId: state.uri.queryParameters['owner-id']!,
      );

  String get location => GoRouteData.$location(
        '/poll/create',
        queryParams: {
          'owner-id': ownerId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pollDetailsRoute => GoRouteData.$route(
      path: '/poll/details',
      factory: $PollDetailsRouteExtension._fromState,
    );

extension $PollDetailsRouteExtension on PollDetailsRoute {
  static PollDetailsRoute _fromState(GoRouterState state) => PollDetailsRoute(
        state.extra as PollExtra,
      );

  String get location => GoRouteData.$location(
        '/poll/details',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $documentReaderRoute => GoRouteData.$route(
      path: '/documentReader',
      factory: $DocumentReaderRouteExtension._fromState,
    );

extension $DocumentReaderRouteExtension on DocumentReaderRoute {
  static DocumentReaderRoute _fromState(GoRouterState state) =>
      DocumentReaderRoute(
        state.extra as DocumentModel,
      );

  String get location => GoRouteData.$location(
        '/documentReader',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $userProfileRoute => GoRouteData.$route(
      path: '/userProfile',
      factory: $UserProfileRouteExtension._fromState,
    );

extension $UserProfileRouteExtension on UserProfileRoute {
  static UserProfileRoute _fromState(GoRouterState state) => UserProfileRoute(
        uid: state.uri.queryParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/userProfile',
        queryParams: {
          'uid': uid,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userProfileEditRoute => GoRouteData.$route(
      path: '/userProfile/edit',
      factory: $UserProfileEditRouteExtension._fromState,
    );

extension $UserProfileEditRouteExtension on UserProfileEditRoute {
  static UserProfileEditRoute _fromState(GoRouterState state) =>
      UserProfileEditRoute(
        state.extra as UserModel,
      );

  String get location => GoRouteData.$location(
        '/userProfile/edit',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $feedUnvotedListRoute => GoRouteData.$route(
      path: '/feed/unvoted',
      factory: $FeedUnvotedListRouteExtension._fromState,
    );

extension $FeedUnvotedListRouteExtension on FeedUnvotedListRoute {
  static FeedUnvotedListRoute _fromState(GoRouterState state) =>
      FeedUnvotedListRoute(
        state.extra as List<PollModel>,
      );

  String get location => GoRouteData.$location(
        '/feed/unvoted',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
