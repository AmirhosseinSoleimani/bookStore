import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';

class DefaultTextColor extends StatelessWidget {
  const DefaultTextColor({super.key, required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.copyWith(color: color),
      child: child,
    );
  }
}

class LightText extends StatelessWidget {
  const LightText({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorTheme =
        AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    return DefaultTextColor(
      color: colorTheme!.whiteColor!,
      child: child,
    );
  }
}

class DarkText extends StatelessWidget {
  const DarkText({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorTheme =
    AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    return DefaultTextColor(
      color: colorTheme!.colorBlack!,
      child: child,
    );
  }
}
