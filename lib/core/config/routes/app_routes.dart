import 'package:get/get.dart';
import 'package:ticket_reselling/export.dart';
import 'package:ticket_reselling/features/screen/auth/login_screen.dart';
import 'package:ticket_reselling/features/screen/root/root_screen.dart';
import 'package:ticket_reselling/features/screen/splash/splash_screen.dart';
import 'package:ticket_reselling/furniture_app/screens/intro_choose_lang.dart';
import 'package:ticket_reselling/location_check/loc.dart';
import 'package:ticket_reselling/location_check/location_check.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String noInternet = "/noInternet";
  static const String loginScreen = "/loginScreen";
  static const String rootScreen = "/rootScreen";

  static const String locScreen = "/locScreen";
  // furniture app
  static const String selectLanguageScreen = "/selectLanguageScreen";
  static const String homeScreen = "/homeScreen";
  static const String otpScreen = "/otpScreen";
  static const String profileSetupScreen = "/profileSetupScreen";
  static const String CategoryScreen = "/CategoryScreen";

  static List<GetPage> getPages = [
    GetPage(name: locScreen, page: () => Check()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: noInternet, page: () => Container()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: rootScreen, page: () => const RootScreen()),

    // furniture app
    GetPage(
        name: selectLanguageScreen,
        page: () => const Intro_Choose_Language_Screen()),
  ];
}
