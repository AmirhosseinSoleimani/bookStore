import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/features.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/button_widget.dart';

class StarterPageScreen extends StatelessWidget {
  static const starterPageName = '/starter_page';
  const StarterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    final textLocalization = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.fromSize(
            size: MediaQuery.of(context).size,
            child: ImageManager.backgroundStarterPage.imageWidget(
              boxFit: BoxFit.cover,
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
                textLocalization.getStarted.toLabel(
                textStyle: textTheme!.mobileBold16.copyWith(
                  color: colorTheme!.primaryColor,
                  fontSize: AppSize.s48,
                  fontFamily: FontConstants.lobsterFontFamily
                ),
              ),
              textLocalization.getStartedText.toLabel(
                textStyle: textTheme.mobileBold16.copyWith(
                    color: colorTheme.primaryColor,
                    fontSize: AppSize.s24,
                    fontFamily: FontConstants.lobsterFontFamily
                ),
              ),
              const Spacer(),
              ButtonWidget(
                backgroundColor: colorTheme.primaryColor!,
                title: textLocalization.createAccount,
                textStyle: textTheme.mobileRegular14.copyWith(
                  color: colorTheme.darkBrown,
                  fontSize: AppSize.s18
                ),
                onTap: () {  },
              ),
              AppSize.s8.heightSizeBox(),
              ButtonWidget(
                backgroundColor: colorTheme.transparentColor!,
                borderColor: colorTheme.primaryColor!,
                title: textLocalization.signIn,
                textStyle: textTheme.mobileRegular14.copyWith(
                    color: colorTheme.primaryColor,
                    fontSize: AppSize.s18
                ),
                onTap: () {
                  context.go
                    (HomeScreen.homePageName);
                },
              ),
            ],
          ).paddingSymmetric(horizontal: AppPadding.p12, vertical: AppPadding.p16),
        ],
      ),
    );
  }
}
