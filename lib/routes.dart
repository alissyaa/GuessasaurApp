import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guessasaur/pages/form_page.dart';
import 'package:guessasaur/pages/splash_screen.dart';
import 'package:guessasaur/pages/welcome_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String form = '/form';
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.welcome,
        name: 'welcome',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomePage();
        },
      ),
      GoRoute(
        path: AppRoutes.form,
        name: 'form',
        builder: (BuildContext context, GoRouterState state) {
          return const FormPage();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    ),
  );
}
