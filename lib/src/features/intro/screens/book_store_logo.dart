import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/widgets/widgets_export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookStoreLogo extends StatelessWidget {
  const BookStoreLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme =
        AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExcludeSemantics(
          child: SvgManager.appIcon.svgPictureWidget(
              color: colorTheme!.offWhite!, height: AppSize.s48),
        ),
        AppStyle().insets.xs.widthSizeBox(),
        StaticTextScale(
          child: (AppLocalizations.of(context).wonderfulLibrary).toLabel(textStyle: textTheme!.mobileBold16.copyWith(color: colorTheme.whiteColor, fontSize: AppSize.s24)),
        )
      ],
    );
  }
}
