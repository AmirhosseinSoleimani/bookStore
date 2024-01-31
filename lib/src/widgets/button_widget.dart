import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.backgroundColor, this.borderColor,required this.title, required this.textStyle, required this.onTap});
  final Color backgroundColor;
  final Color? borderColor;
  final String title;
  final TextStyle textStyle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: AppSize.s48,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6)),
          border: Border.all(
            width: AppSize.s1,
            color: borderColor?? backgroundColor
          ),
        ),
        child: title.toLabel(
          textStyle: textStyle,
          textAlign: TextAlign.center
        ).center,
      ),
    );
  }
}
