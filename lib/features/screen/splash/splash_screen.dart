import 'package:get/get.dart';
import 'package:ticket_reselling/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      checkAuthentication();
    });
    // ControllerSplash.to.onInit();
    super.initState();
  }

  checkAuthentication() async {
    Get.offAllNamed(
      SharedPreferencesService.instance!.isLogin
          ? AppRoutes.rootScreen
          : SharedPreferencesService.instance!.isLanguageSelected
              ? AppRoutes.loginScreen
              : AppRoutes.selectLanguageScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Scaffold(
        backgroundColor: ColorConst.kWhiteColor,
        body: Center(
          child: Padding(
            padding: p48,
            child: const CustomSvgImage(logo: ImageConst.icLogoWhite),
          ),
        ),
      ),
    );
  }
}
