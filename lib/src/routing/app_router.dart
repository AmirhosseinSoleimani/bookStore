import 'package:book_store/src/features/authentication/presentation/starter_page/view/starter_page_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
      initialLocation: StarterPageScreen.starterPageName,
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: StarterPageScreen.starterPageName,
          name: StarterPageScreen.starterPageName,
          builder: (context, state) => const StarterPageScreen()
        )
      ]);
}