import 'package:ticket_reselling/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupNetworkService();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => {runApp(const MyApp())},
  );
}

void setupNetworkService() {
  NetworkService().init();
}
