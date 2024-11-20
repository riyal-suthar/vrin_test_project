import 'package:get/get.dart';
import 'package:ticket_reselling/export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Global.locale,
      // locale: (language == "en" || language == "") ? const Locale('en') : locale,
      // localizationsDelegates: const [
      //   // this line is important
      //   RefreshLocalizations.delegate,
      // ],
      initialRoute: AppRoutes.locScreen,
      getPages: AppRoutes.getPages,
      builder: (context, child) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
