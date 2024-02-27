import 'package:flutter/material.dart';


@immutable
class AppMargin{
  static const double m2 = 2.0;
  static const double m8 = 8.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
}

@immutable
class AppPadding{
  static const double p0 = 0.0;
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
}

@immutable
class AppSize{
  static const double s0 = 0;
  static const double s1 = 1.0;
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s35 = 35.0;
  static const double s42 = 42.0;
  static const double s48 = 48.0;
  static const double s54 = 54.0;
  static const double s60 = 60.0;
  static const double s80 = 80.0;
  static const double s120 = 120.0;
}

@immutable
class AppRadius {
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s16 = 16.0;
  static const double s32 = 32.0;
}


@immutable
class Insets {
  Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

@immutable
class AppTimes {
  final Duration t300 = const Duration(milliseconds: 300);
  final Duration t600 = const Duration(milliseconds: 600);
  final Duration t900 = const Duration(milliseconds: 900);
  final Duration t200 = const Duration(milliseconds: 200);
}