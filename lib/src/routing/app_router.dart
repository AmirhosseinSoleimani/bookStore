import 'package:book_store/src/features/authentication/presentation/starter_page/view/starter_page_screen.dart';
import 'package:book_store/src/features/intro/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


class Navigation {
  static GoRouter goRouter(BuildContext context) {
    return GoRouter(
        initialLocation: IntroScreen.introPageName,
        routes: [
          GoRoute(
              path: IntroScreen.introPageName,
              name: IntroScreen.introPageName,
            pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                    key: state.pageKey,
                    transitionDuration: Duration.zero,
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                    child: const IntroScreen(),
                    );
            }
          ),
          GoRoute(
              path: StarterPageScreen.starterPageName,
              name: StarterPageScreen.starterPageName,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  transitionDuration: Duration.zero,
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                  child: const StarterPageScreen(),
                );
              }
          ),
        ],
    );
  }
}