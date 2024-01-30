import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

class StarterPageScreen extends StatelessWidget {
  static const starterPageName = '/starter_page';
  const StarterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    // final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
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
            children: [
              'getStarted'.localization.toLabel(
                // textStyle: textTheme!.mobileBold16.copyWith(
                  // color: colorTheme!.whiteColor
                // )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
