import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'circle_button.dart';


class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.border,
    this.bgColor,
    this.color,
    this.size,
    this.iconSize,
    this.flipIcon = false,
    required this.semanticLabel,
  });

  static double defaultSize = AppSize.s28;

  final IconData icon;
  final VoidCallback? onPressed;
  final BorderSide? border;
  final Color? bgColor;
  final Color? color;
  final String semanticLabel;
  final double? size;
  final double? iconSize;
  final bool flipIcon;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    Color defaultColor = colorTheme!.greyStrong!;
    Color iconColor = color ?? colorTheme.offWhite!;
    return CircleButton(
      onPressed: onPressed,
      border: border,
      size: size,
      bgColor: bgColor ?? defaultColor,
      semanticLabel: semanticLabel,
      child: Transform.scale(
        scaleX: flipIcon ? -1 : 1,
        child: Icon(icon, size: iconSize ?? defaultSize, color: iconColor),
      ),
    );
  }

  Widget safe() => _SafeAreaWithPadding(child: this);
}

class _SafeAreaWithPadding extends StatelessWidget {
  const _SafeAreaWithPadding({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.all(AppStyle().insets.sm),
        child: child,
      ),
    );
  }
}