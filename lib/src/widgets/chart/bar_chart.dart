
import 'package:book_store/src/core/resources/resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


BarChartGroupData makeGroupData(BuildContext context, Color touchedBarColor, Color barBackgroundColor, int x, double y, {bool isTouched = false, Color? barColor, double width = 22, List<int> showTooltips = const [],}) {
  barColor ??= barColor;
  final colorTheme =
  AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: isTouched ? y + 1 : y,
        color: isTouched ? touchedBarColor : barColor,
        width: width,
        borderSide: isTouched
            ? BorderSide(color: touchedBarColor)
            : BorderSide(color: colorTheme!.whiteColor!, width: AppSize.s0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 20,
          color: barBackgroundColor,
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroups({required BuildContext context,required Color touchedBarColor, required Color barBackgroundColor, required int touchedIndex, required Color barColor}) => List.generate(7, (i) {
  switch (i) {
    case 0:
      return makeGroupData(context, touchedBarColor, barBackgroundColor ,barColor: barColor ,0, 5, isTouched: i == touchedIndex);
    case 1:
      return makeGroupData(context, touchedBarColor, barBackgroundColor ,barColor: barColor ,1, 6.5, isTouched: i == touchedIndex);
    case 2:
      return makeGroupData(context, touchedBarColor, barBackgroundColor ,barColor: barColor ,2, 5, isTouched: i == touchedIndex);
    case 3:
      return makeGroupData(context, touchedBarColor, barBackgroundColor,barColor: barColor , 3, 7.5, isTouched: i == touchedIndex);
    case 4:
      return makeGroupData(context, touchedBarColor, barBackgroundColor,barColor: barColor , 4, 9, isTouched: i == touchedIndex);
    case 5:
      return makeGroupData(context, touchedBarColor, barBackgroundColor,barColor: barColor , 5, 11.5, isTouched: i == touchedIndex);
    case 6:
      return makeGroupData(context, touchedBarColor, barBackgroundColor,barColor: barColor , 6, 6.5, isTouched: i == touchedIndex);
    default:
      return throw Error();
  }
});

BarChartData mainBarData({required BuildContext context, required Color touchedBarColor, required Color barBackgroundColor, required int touchedIndex, required Color barColor}) {
  final colorTheme =
  AppTheme.of(context).materialThemeData.extension<ColorThemeExtension>();
  return BarChartData(
    barTouchData: BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: colorTheme!.colorGreyBox!,
        tooltipHorizontalAlignment: FLHorizontalAlignment.center,
        tooltipMargin: -10,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay;
          switch (group.x) {
            case 0:
              weekDay = 'Monday';
              break;
            case 1:
              weekDay = 'Tuesday';
              break;
            case 2:
              weekDay = 'Wednesday';
              break;
            case 3:
              weekDay = 'Thursday';
              break;
            case 4:
              weekDay = 'Friday';
              break;
            case 5:
              weekDay = 'Saturday';
              break;
            case 6:
              weekDay = 'Sunday';
              break;
            default:
              throw Error();
          }
          return BarTooltipItem(
            '$weekDay\n',
            TextStyle(
              color: colorTheme.whiteColor!,
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s18,
            ),
            children: <TextSpan>[
              TextSpan(
                text: (rod.toY - 1).toString(),
                style: TextStyle(
                  color: touchedBarColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => getTitles(context, value, meta),
          reservedSize: 38,
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    barGroups: showingGroups(context: context, touchedBarColor: touchedBarColor, barBackgroundColor: barBackgroundColor, touchedIndex: touchedIndex, barColor: barColor),
    gridData: const FlGridData(show: false),
  );
}

Widget getTitles(BuildContext context, double value, TitleMeta meta) {
  final textTheme = AppTheme.of(context).materialThemeData.extension<TextThemeExtension>();
  final style = textTheme!.mobileBold14;
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text('M', style: style);
      break;
    case 1:
      text = Text('T', style: style);
      break;
    case 2:
      text = Text('W', style: style);
      break;
    case 3:
      text = Text('T', style: style);
      break;
    case 4:
      text = Text('F', style: style);
      break;
    case 5:
      text = Text('S', style: style);
      break;
    case 6:
      text = Text('S', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: AppSize.s16,
    child: text,
  );
}