

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../screens/app_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  routes: $appRoutes,
);

@TypedGoRoute<AppScreenRoute>(
  path: '/',
  routes: [],
)


@immutable
class AppScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppScreen();
  }
}
