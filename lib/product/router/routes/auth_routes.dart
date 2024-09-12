part of '../route_tree.dart';

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const String path = '/auth/login';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: const LoginView());
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  static const String path = '/auth/register';
  static final $parentNavigatorKey = AppRouter.rootNavigatorKey;
  @override
  TPage buildPage(BuildContext context, GoRouterState state) {
    return TPage(child: const RegisterView());
  }
}