import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.hasBorder = false,
    this.padding,
    this.fontSize,
    this.fontWeight,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: hasBorder ? MaterialStateProperty.all<Color>(backgroundColor ?? colorTheme!.transparentColor!) : MaterialStateProperty.all<Color>(backgroundColor ?? colorTheme!.primaryColor!),
        foregroundColor: hasBorder ? MaterialStateProperty.all<Color>(backgroundColor ?? colorTheme!.primaryColor!) : MaterialStateProperty.all<Color>(backgroundColor ?? colorTheme!.darkBrown!),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r6),
            side: hasBorder ? BorderSide(color: borderColor ?? colorTheme!.primaryColor!, width: borderWidth ?? AppSize.s1) : BorderSide.none,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding ?? const EdgeInsets.all(AppPadding.p12)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Optional: adjust tap area size
      ),
      child: Text(
        text,
        style: textTheme!.mobileRegular14.copyWith(fontSize: fontSize ?? AppSize.s18, fontWeight: fontWeight ?? FontWeight.bold),
      ),
    );

  }
}
