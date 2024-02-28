import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/features/intro/domain/intro_data_model.dart';
import 'package:flutter/material.dart';
import 'package:book_store/src/widgets/widgets_export.dart';
import '../domain/page_data_entity.dart';

class PageData extends StatelessWidget {
  const PageData({super.key, required this.data});

  final PageDataEntity data;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
    final colorTheme = AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
    return Semantics(
      liveRegion: true,
      child: Column(
        children: [
          const Spacer(),
          (IntroDataModel.imageSize + IntroDataModel.logoHeight)
              .heightSizeBox(),
          SizedBox(
            height: IntroDataModel.textHeight,
            width: 400,
            child: StaticTextScale(
              child: ListView(
                shrinkWrap: true,
                children: [
                  data.title.toLabel(textStyle: textTheme!.mobileBold16.copyWith(color: colorTheme!.whiteColor, fontSize: AppSize.s18), textAlign: TextAlign.center),
                  SizedBox(
                    height: AppStyle().insets.sm,
                  ),
                  data.desc.toLabel(textStyle: textTheme.mobileRegular14.copyWith(color: colorTheme.whiteColor, fontSize: AppSize.s14), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          (IntroDataModel.pageIndicatorHeight).heightSizeBox(),
          const Spacer(
            flex: 2,
          )
        ],
      ).paddingSymmetric(horizontal: AppStyle().insets.md),
    );
  }
}
