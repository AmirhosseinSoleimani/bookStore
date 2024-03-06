import 'package:book_store/src/core/extensions/extensions.dart';
import 'package:book_store/src/core/resources/resources.dart';
import 'package:book_store/src/widgets/widgets_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartComponent extends StatelessWidget {
  const BarChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme =
    AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();

    int touchedIndex = -1;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: AppSize.s150,
      child: AspectRatio(
        aspectRatio: AppSize.s1,
        child: BarChart(
          mainBarData(context: context, touchedBarColor: colorTheme!.whiteColor!, barBackgroundColor: colorTheme.colorGreyBox!.withOpacity(0.2), touchedIndex: touchedIndex, barColor: colorTheme.colorBlack!),
          swapAnimationDuration: AppTimes().t2500,
        ).paddingSymmetric(horizontal: AppPadding.p8),
      ),
    );
  }
}

