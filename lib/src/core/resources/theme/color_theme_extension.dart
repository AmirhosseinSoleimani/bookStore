import 'package:flutter/material.dart';

class ColorThemeExtension extends ThemeExtension<ColorThemeExtension> {
  final Color? darkBrown,
      primaryColor,
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
      purple,
      lightBlue,
      colorGreyBox,
      whiteColor,
      offWhite,
      greyStrong,
      greyMedium,
      accent1,
      accent2,
      redColor,
      transparentColor;

  ColorThemeExtension(
      {required this.darkBrown,
      required this.primaryColor,
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
      required this.purple,
      required this.lightBlue,
      required this.colorGreyBox,
      required this.whiteColor,
      required this.redColor,
      required this.transparentColor,
      required this.offWhite,
      required this.greyStrong,
      required this.greyMedium,
      required this.accent1,
      required this.accent2});

  @override
  ColorThemeExtension copyWith({
    final Color? darkBrown,
    primaryColor,
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
    purple,
    lightBlue,
    colorGreyBox,
    redColor,
    offWhite,
    greyStrong,
    greyMedium,
    accent1,
    accent2,
    whiteColor,
    transparentColor,
  }) {
    return ColorThemeExtension(
        darkBrown: darkBrown ?? this.darkBrown,
        primaryColor: primaryColor ?? this.primaryColor,
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
        darkThemeBoxBackgroundDark:
            darkThemeBoxBackgroundDark ?? this.darkThemeBoxBackgroundDark,
        darkThemeBoxBackground:
            darkThemeBoxBackground ?? this.darkThemeBoxBackground,
        darkThemeBoxBackgroundLight:
            darkThemeBoxBackgroundLight ?? this.darkThemeBoxBackgroundLight,
        redColor: redColor ?? this.redColor,
        offWhite: offWhite ?? this.offWhite,
        greyStrong: greyStrong ?? this.greyStrong,
        greyMedium: greyMedium ?? this.greyMedium,
        accent1: accent1 ?? this.accent1,
        accent2: accent2 ?? this.accent2,
        transparentColor: transparentColor ?? this.transparentColor,
        purple: purple ?? this.purple,
        lightBlue: lightBlue ?? lightBlue,
    );
  }

  factory ColorThemeExtension.light() => ColorThemeExtension(
        darkBrown: _convertColor('#4A2B29'),
        primaryColor: _convertColor('#EFE3C8'),
        colorSharpOrangeLight: _convertColor('#FD701D'),
        colorSharpOrange2: _convertColor('#FF4D00'),
        colorSharpOrangeDarker: _convertColor('#F2600A'),
        colorSharpOrangeDarkFont: _convertColor('#8B3300'),
        colorBlack: _convertColor('#1E1B18'),
        darkThemePrimary: _convertColor('#2E3D3D'),
        darkThemePrimaryLight: _convertColor('#8E8E8E'),
        darkThemeBackgroundLight: _convertColor('#F5F5FA'),
        colorGreyBox: _convertColor('#6b6d70'),
        whiteColor: _convertColor('#ffffff'),
        darkThemeBoxBackgroundDark: _convertColor('#d6d6d6'),
        darkThemeBoxBackground: _convertColor('#e6e6e6'),
        darkThemeBoxBackgroundLight: _convertColor('#f5f5f5'),
        redColor: _convertColor('#ff1414'),
        offWhite: _convertColor('#8ECE5'),
        greyStrong: _convertColor('#272625'),
        greyMedium: _convertColor('#9D9995'),
        accent1: _convertColor('#E4935D'),
        accent2: _convertColor('#BEABA1'),
        purple: _convertColor('#6463D6'),
        lightBlue: _convertColor('#2FBFDE'),
        transparentColor: Colors.transparent,
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
      darkBrown: Color.lerp(darkBrown, other.darkBrown, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
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
      darkThemeBoxBackground:
          Color.lerp(darkThemeBoxBackground, other.darkThemeBoxBackground, t),
      darkThemeBoxBackgroundLight: Color.lerp(
          darkThemeBoxBackgroundLight, other.darkThemeBoxBackgroundLight, t),
      redColor: Color.lerp(redColor, other.redColor, t),
      offWhite: Color.lerp(offWhite, other.offWhite, t),
      greyStrong: Color.lerp(greyStrong, other.greyStrong, t),
      greyMedium: Color.lerp(greyMedium, other.greyMedium, t),
      accent1: Color.lerp(accent1, other.accent1, t),
      accent2: Color.lerp(accent2, other.accent2, t),
      transparentColor: Color.lerp(transparentColor, other.transparentColor, t),
      purple: Color.lerp(purple, other.transparentColor, t),
      lightBlue: Color.lerp(lightBlue, other.transparentColor, t),
    );
  }
}
