import 'package:flutter/material.dart';
import 'package:book_store/src/core/resources/resources.dart';

abstract class AppThemeData {
  ThemeData get materialThemeData;
  ThemeData get materialMainRoutesThemeData;
  ThemeData get cupertinoMainRoutesThemeData;
  ThemeData get materialThemeDataWithExtensionLoaded;
  ThemeData get materialModalTextFieldTheme;
  ThemeData get cupertinoModalTextFieldTheme;
}

class LightAppThemeData extends AppThemeData {

  @override
  ThemeData get materialThemeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: [
      ColorThemeExtension.light(),
      TextThemeExtension.light(),
    ],
  );

  @override
  ThemeData get materialThemeDataWithExtensionLoaded {
    final textTheme = materialThemeData.extension<TextThemeExtension>()!;
    final colorTheme = materialThemeData.extension<ColorThemeExtension>()!;
    return materialThemeData.copyWith(
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorTheme.whiteColor,
        closeIconColor: colorTheme.colorBlack,
        showCloseIcon: true,
        contentTextStyle: textTheme.mobileRegular10,
        behavior: SnackBarBehavior.fixed,
        elevation: 0.0,
      ),
    );
  }

  @override
  ThemeData get cupertinoMainRoutesThemeData => throw UnimplementedError();

  @override
  ThemeData get cupertinoModalTextFieldTheme => throw UnimplementedError();

  @override
  ThemeData get materialMainRoutesThemeData {
    final textTheme = materialThemeData.extension<TextThemeExtension>()!;
    final colorTheme = materialThemeData.extension<ColorThemeExtension>()!;
    return materialThemeDataWithExtensionLoaded.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorTheme.colorGreyBox,
        elevation: AppSize.s0,
        centerTitle: true,
        titleTextStyle: textTheme.mobileBold14,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorTheme.darkThemePrimary,
        unselectedItemColor: colorTheme.darkThemePrimaryLight,
        type: BottomNavigationBarType.fixed
      )
    );
  }

  @override
  // TODO: implement materialModalTextFieldTheme
  ThemeData get materialModalTextFieldTheme => throw UnimplementedError();
}


class DarkAppThemeData extends AppThemeData{

  @override
  ThemeData get materialThemeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [
      ColorThemeExtension.light(),
      TextThemeExtension.light(),
    ],
  );

  @override
  // TODO: implement cupertinoMainRoutesThemeData
  ThemeData get cupertinoMainRoutesThemeData => throw UnimplementedError();

  @override
  // TODO: implement cupertinoModalTextFieldTheme
  ThemeData get cupertinoModalTextFieldTheme => throw UnimplementedError();

  @override
  // TODO: implement materialMainRoutesThemeData
  ThemeData get materialMainRoutesThemeData => throw UnimplementedError();

  @override
  // TODO: implement materialModalTextFieldTheme
  ThemeData get materialModalTextFieldTheme => throw UnimplementedError();

  @override
  // TODO: implement materialThemeDataWithExtensionLoaded
  ThemeData get materialThemeDataWithExtensionLoaded => throw UnimplementedError();
}

