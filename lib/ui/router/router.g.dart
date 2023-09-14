// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appScreenRoute,
    ];

RouteBase get $appScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $AppScreenRouteExtension._fromState,
    );

extension $AppScreenRouteExtension on AppScreenRoute {
  static AppScreenRoute _fromState(GoRouterState state) => AppScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
