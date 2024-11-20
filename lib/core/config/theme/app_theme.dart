import 'package:ticket_reselling/core/utils/extensions/widget_extension.dart';
import 'package:ticket_reselling/export.dart';

class AppTheme {
  AppTheme._();

  static ThemeData data = ThemeData(
    fontFamily: 'RoobertPro',
    brightness: Brightness.light,
    primarySwatch: ColorConst.kPrimaryColor.toMaterialColor(),
    primaryColor: ColorConst.kPrimaryColor,
    buttonTheme: _lightButtonTheme,
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
    tabBarTheme: _lightTabBarTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    inputDecorationTheme: _lightInputDecorationTheme,
  );

  static const InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius12),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius12),
      borderSide: BorderSide(color: ColorConst.kBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius12),
      borderSide: BorderSide(color: ColorConst.kBorderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius12),
      borderSide: BorderSide(color: ColorConst.kBorderColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(radius12),
      borderSide: BorderSide(color: ColorConst.kBorderColor),
    ),
  );

  static final ButtonThemeData _lightButtonTheme = ButtonThemeData(
    buttonColor: ColorConst.kPrimaryColor,
    disabledColor: ColorConst.kDisableColor,
  );

  static final ColorScheme _lightColorScheme = ColorScheme.light(
    primary: ColorConst.kPrimaryColor,
    onPrimary: ColorConst.kWhiteColor,
    surface: ColorConst.kWhiteColor,
    onSurface: Color(0xDE04294E),
    secondary: ColorConst.kSecondaryColor,
    onSecondary: Colors.black,
    brightness: Brightness.light,
    tertiary: Color(0xDE04294E),
    outline: Color.fromRGBO(132, 134, 135, 1),
  );

  static final TabBarTheme _lightTabBarTheme = TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    unselectedLabelColor: ColorConst.kDisableColor,
    indicatorColor: ColorConst.kSecondaryColor,
    dividerColor: ColorConst.kGray100Color,
    dividerHeight: 3,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: ColorConst.kSecondaryColor,
    textScaler: TextScaler.noScaling,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 3, color: ColorConst.kSecondaryColor),
    ),
  );

  static final TextTheme _lightTextTheme = TextTheme(
    labelSmall: TextStyle(color: ColorConst.kWhiteColor, fontSize: 10),
    labelLarge: TextStyle(color: ColorConst.kWhiteColor, fontSize: 12, fontWeight: FontWeight.w600),
    bodySmall: TextStyle(color: ColorConst.kWhiteColor, fontSize: 12),
    bodyMedium: TextStyle(color: ColorConst.kWhiteColor, fontSize: 14),
    bodyLarge: TextStyle(color: ColorConst.kWhiteColor, fontSize: 16),
    titleSmall: TextStyle(color: ColorConst.kWhiteColor, fontSize: 14, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(color: ColorConst.kWhiteColor, fontSize: 16, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(color: ColorConst.kWhiteColor, fontSize: 20, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(color: ColorConst.kWhiteColor, fontSize: 18, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(color: ColorConst.kWhiteColor, fontSize: 24, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(color: ColorConst.kWhiteColor, fontSize: 26, fontWeight: FontWeight.w700),
  );

  static ThemeData lightTheme = data;

  static ThemeData darkTheme = data;

  static final PageTransitionsTheme _pageTransitionsTheme = const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );
}
