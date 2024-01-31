import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';

AppBar customAppBar({required BuildContext context, String? title, IconData? iconData, VoidCallback? onTap, List<Widget>? actions}) {
  final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title ?? '',
      style: textTheme?.mobileBold14,
    ),
    leading: iconData != null ? GestureDetector(
      onTap: onTap,
      child: Icon(
          iconData,
          size: AppSize.s28,
          color: colorTheme?.primaryColor,
      ),
    ) : const SizedBox(),
    actions: actions,
  );
}
