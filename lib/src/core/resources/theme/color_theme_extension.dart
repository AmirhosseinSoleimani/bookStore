import 'package:flutter/material.dart';

class ColorThemeExtension
    extends ThemeExtension<ColorThemeExtension> {
  final Color? colorHoloGreyPrimary,
      darkThemeSecondary,
      colorSharpOrangeLight,
      colorSharpOrange2,
      colorSharpOrangeDarker,
      colorSharpOrangeDarkFont,
      colorBlack,
      darkThemePrimary,
      darkThemePrimaryLight,
      darkThemeBackgroundLight,
      darkThemeBoxBackground,
      darkThemeBoxBackgroundDark,
      darkThemeBoxBackgroundLight,
      colorGreyBox,
      whiteColor,
      redColor;

  ColorThemeExtension(
      {required this.colorHoloGreyPrimary,
      required this.darkThemeSecondary,
      required this.colorSharpOrangeLight,
      required this.colorSharpOrange2,
      required this.colorSharpOrangeDarker,
      required this.colorSharpOrangeDarkFont,
      required this.colorBlack,
      required this.darkThemePrimary,
      required this.darkThemePrimaryLight,
      required this.darkThemeBackgroundLight,
      required this.darkThemeBoxBackgroundDark,
      required this.darkThemeBoxBackground,
      required this.darkThemeBoxBackgroundLight,
      required this.colorGreyBox,
      required this.whiteColor,
      required this.redColor,
      });

  @override
  ColorThemeExtension copyWith(
      {final Color? colorHoloGreyPrimary,
      darkThemeSecondary,
      colorSharpOrangeLight,
      colorSharpOrange2,
      colorSharpOrangeDarker,
      colorSharpOrangeDarkFont,
      colorBlack,
      darkThemePrimary,
      darkThemePrimaryLight,
      darkThemeBackgroundLight,
      darkThemeBoxBackground,
      darkThemeBoxBackgroundDark,
      darkThemeBoxBackgroundLight,
      colorGreyBox,
      redColor,
      whiteColor}) {
    return ColorThemeExtension(
      colorHoloGreyPrimary: colorHoloGreyPrimary ?? this.colorHoloGreyPrimary,
      darkThemeSecondary: darkThemeSecondary ?? this.darkThemeSecondary,
      colorSharpOrangeLight:
          colorSharpOrangeLight ?? this.colorSharpOrangeLight,
      colorSharpOrange2: colorSharpOrange2 ?? this.colorSharpOrange2,
      colorSharpOrangeDarker:
          colorSharpOrangeDarker ?? this.colorSharpOrangeDarker,
      colorSharpOrangeDarkFont:
          colorSharpOrangeDarkFont ?? this.colorSharpOrangeDarkFont,
      colorBlack: colorBlack ?? this.colorBlack,
      darkThemePrimary: darkThemePrimary ?? this.darkThemePrimary,
      darkThemePrimaryLight:
          darkThemePrimaryLight ?? this.darkThemePrimaryLight,
      whiteColor: whiteColor ?? this.whiteColor,
      colorGreyBox: colorGreyBox ?? this.colorGreyBox,
      darkThemeBackgroundLight:
          darkThemeBackgroundLight ?? this.darkThemeBackgroundLight,
      darkThemeBoxBackgroundDark: darkThemeBoxBackgroundDark ?? this.darkThemeBoxBackgroundDark,
      darkThemeBoxBackground: darkThemeBoxBackground ?? this.darkThemeBoxBackground,
      darkThemeBoxBackgroundLight: darkThemeBoxBackgroundLight ?? this.darkThemeBoxBackgroundLight,
      redColor: redColor ?? this.redColor,
    );
  }

  factory ColorThemeExtension.light() => ColorThemeExtension(
        colorHoloGreyPrimary: _convertColor('#464545'),
        darkThemeSecondary: _convertColor('#FF6B00'),
        colorSharpOrangeLight: _convertColor('#FD701D'),
        colorSharpOrange2: _convertColor('#FF4D00'),
        colorSharpOrangeDarker: _convertColor('#F2600A'),
        colorSharpOrangeDarkFont: _convertColor('#8B3300'),
        colorBlack: _convertColor('#000000'),
        darkThemePrimary: _convertColor('#2E3D3D'),
        darkThemePrimaryLight: _convertColor('#8E8E8E'),
        darkThemeBackgroundLight: _convertColor('#F5F5FA'),
        colorGreyBox: _convertColor('#6b6d70'),
        whiteColor: _convertColor('#ffffff'),
        darkThemeBoxBackgroundDark: _convertColor('#d6d6d6'),
        darkThemeBoxBackground: _convertColor('#e6e6e6'),
        darkThemeBoxBackgroundLight: _convertColor('#f5f5f5'),
        redColor: _convertColor('#ff1414')
      );

  static Color _convertColor(String hexCode) =>
      Color(int.parse('0xFF${hexCode.replaceAll('#', '')}'));

  @override
  ThemeExtension<ColorThemeExtension> lerp(
      ColorThemeExtension? other, double t) {
    if (other is! ColorThemeExtension) {
      return this;
    }

    return ColorThemeExtension(
      colorHoloGreyPrimary:
          Color.lerp(colorHoloGreyPrimary, other.colorHoloGreyPrimary, t),
      darkThemeSecondary: Color.lerp(darkThemeSecondary, other.darkThemeSecondary, t),
      colorSharpOrangeLight:
          Color.lerp(colorSharpOrangeLight, other.colorSharpOrangeLight, t),
      colorSharpOrange2:
          Color.lerp(colorSharpOrange2, other.colorSharpOrange2, t),
      colorSharpOrangeDarker:
          Color.lerp(colorSharpOrangeDarker, other.colorSharpOrangeDarker, t),
      colorSharpOrangeDarkFont: Color.lerp(
          colorSharpOrangeDarkFont, other.colorSharpOrangeDarkFont, t),
      colorBlack: Color.lerp(colorBlack, other.colorBlack, t),
      darkThemePrimary: Color.lerp(darkThemePrimary, other.darkThemePrimary, t),
      darkThemePrimaryLight:
          Color.lerp(darkThemePrimaryLight, other.darkThemePrimaryLight, t),
      colorGreyBox: Color.lerp(colorGreyBox, other.colorGreyBox, t),
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t),
      darkThemeBackgroundLight: Color.lerp(
          darkThemeBackgroundLight, other.darkThemeBackgroundLight, t),
      darkThemeBoxBackgroundDark: Color.lerp(
          darkThemeBoxBackgroundDark, other.darkThemeBoxBackgroundDark, t),
      darkThemeBoxBackground: Color.lerp(
          darkThemeBoxBackground, other.darkThemeBoxBackground, t),
      darkThemeBoxBackgroundLight: Color.lerp(
          darkThemeBoxBackgroundLight, other.darkThemeBoxBackgroundLight, t),
      redColor: Color.lerp(
          redColor, other.redColor, t),
    );
  }
}
