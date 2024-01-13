import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutoring_app/app/config/routes/named_routes.dart';
import 'package:tutoring_app/app/modules/auth/views/home_page.dart';
import 'package:tutoring_app/app/modules/auth/views/location_screen.dart';
import 'package:tutoring_app/app/modules/auth/views/login.dart';
import 'package:tutoring_app/app/modules/auth/views/profile_screen.dart';
import 'package:tutoring_app/app/modules/auth/views/register.dart';
import 'package:tutoring_app/app/modules/auth/views/splashscreen.dart';
import 'package:tutoring_app/app/modules/navbar/views/navbar_screen.dart';
import 'package:tutoring_app/app/modules/navbar/widgets/bottom_navbar_tabs.dart';

///[rootNavigatorKey] used for global | general navigation
final rootNavigatorKey = GlobalKey<NavigatorState>();
//final form = GlobalKey<FormState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const SizedBox();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: MyNamedRoutes.register,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MyNamedRoutes.root,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.login}",
        name: MyNamedRoutes.login,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:
              // SizedBox()
              const LoginScreen(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: "/${MyNamedRoutes.register}",
        name: MyNamedRoutes.register,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child:
              // SizedBox()
              RegisterScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(
            tabs: BottomNavBarTabs.tabs(context),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "${MyNamedRoutes.homePage}",
            name: MyNamedRoutes.homePage,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
            ),
          ),
          GoRoute(
            path: "${MyNamedRoutes.profile}",
            name: MyNamedRoutes.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
          GoRoute(
            path: "${MyNamedRoutes.locations}",
            name: MyNamedRoutes.locations,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const LocationsScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
