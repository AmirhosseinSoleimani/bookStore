import 'package:book_store/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/resources/resources.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final _lightTheme = LightAppThemeData();

  static final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      theme: _lightTheme.materialThemeData,
      routerConfig: goRouter,
    );
  }
}


