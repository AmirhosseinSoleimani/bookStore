import 'package:book_store/src/features/features.dart';
import 'package:book_store/src/features/library/library.dart';
import 'package:book_store/src/features/profile/profile.dart';
import 'package:book_store/src/features/write/write.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final homeTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeTabNavigatorKey');
  static final profileTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileTabNavigatorKey');
  static final libraryTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'libraryTabNavigatorKey');
  static final writeTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'writeTabNavigatorKey');

  static final routes = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: '/splash-screen',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: SplashScreen.splashPageName,
            name: SplashScreen.splashPageName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: Duration.zero,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
                child: const SplashScreen(),
              );
            }),
        GoRoute(
            path: IntroScreen.introPageName,
            name: IntroScreen.introPageName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: Duration.zero,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
                child: const IntroScreen(),
              );
            }),
        GoRoute(
            path: StarterPageScreen.starterPageName,
            name: StarterPageScreen.starterPageName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: Duration.zero,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
                child: const StarterPageScreen(),
              );
            }),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              // the UI shell
              return BottomNavigationBarScreen(
                  navigationShell: navigationShell);
            },
            parentNavigatorKey: parentNavigatorKey,
            branches: [
              StatefulShellBranch(
                navigatorKey: homeTabNavigatorKey,
                routes: [
                  GoRoute(
                    path: HomeScreen.homePagePath,
                    name: HomeScreen.homePageName,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionDuration: Duration.zero,
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                        child: const HomeScreen(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: libraryTabNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/library',
                    name: 'library',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionDuration: Duration.zero,
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                        child: const Library(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: writeTabNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/write',
                    name: 'write',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionDuration: Duration.zero,
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                        child: const Write(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: profileTabNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/profile',
                    name: 'profile',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        transitionDuration: Duration.zero,
                        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                        child: const Profile(),
                      );
                    },
                  ),
                ],
              ),
            ],
            ),
      ],
    );


  static Page getPage({
    required Widget child,
    required GoRouterState state,
    required String name,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
      name: name,
    );
  }
}
