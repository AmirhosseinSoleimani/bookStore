import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required super.child,
    required this.lightTheme,
    required this.darkTheme,
  });
  final AppThemeData lightTheme;
  final AppThemeData darkTheme;

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static AppThemeData of(BuildContext context) {
    final AppTheme? inheritedTheme =
    context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedTheme != null,
    'No AppTheme found in the current context');
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? inheritedTheme!.darkTheme
        : inheritedTheme!.lightTheme;
  }
}
