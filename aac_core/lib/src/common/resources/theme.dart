import 'package:aac_core/aac_core.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    platform: TargetPlatform.iOS,
    fontFamily: Configs.defaultFont,
    applyElevationOverlayColor: true,
    splashColor: Colors.white24,
    primarySwatch: Colors.white.toMaterialColor(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayMedium: textStyle.medium.w400.fill(ColorName.carbonGrey),
      bodyMedium: textStyle.medium.w400.fill(ColorName.carbonGrey),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.light, // iOS
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorName.primaryGreen,
      selectionColor: ColorName.primaryGreen,
      selectionHandleColor: ColorName.primaryGreen,
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
