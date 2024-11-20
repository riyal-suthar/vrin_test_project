import 'package:get/get.dart';
import 'package:ticket_reselling/export.dart';

class ControllerSplash extends GetxController with WidgetsBindingObserver {
  //NETWORK CONNECTIVITY CODE
  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  static ControllerSplash get to => Get.isRegistered<ControllerSplash>() ? Get.find() : Get.put(ControllerSplash());

  bool isInternetAvailable = false;

  // @override
  // void onInit() {
  //   super.onInit();
  //   initConnectivity();
  //   _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }
  //
  // @override
  // void dispose() {
  //   _connectivitySubscription.cancel();
  //   super.dispose();
  // }

  // //Internet connectivity check
  // Future<void> initConnectivity() async {
  //   late List<ConnectivityResult> result;
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     Logger.logPrint(title: 'Couldn\'t check connectivity status', body: e.toString());
  //     return;
  //   }
  //
  //   return _updateConnectionStatus(result);
  // }
  //
  // Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
  //   _connectionStatus = result;
  //
  //   if (_connectionStatus.first == ConnectivityResult.mobile) {
  //     debugPrint("Mobile network---------");
  //     isInterNetExist = 1;
  //     if (!isInternetAvailable) {
  //       isInternetAvailable = true;
  //       isNetworkDisabled.value = false;
  //       // if (isInterNetExist == 0) {
  //       //   onInit();
  //       // }
  //       // update();
  //       // Get.back(result: true);
  //     }
  //   } else if (_connectionStatus.first == ConnectivityResult.wifi) {
  //     isInterNetExist = 1;
  //
  //     isInternetAvailable = true;
  //     isNetworkDisabled.value = false;
  //
  //     debugPrint("WIFI network---------");
  //     update();
  //   } else if (_connectionStatus.first == ConnectivityResult.none) {
  //     debugPrint("No network---------");
  //
  //     isInterNetExist = 0;
  //     isInternetAvailable = false;
  //     isNetworkDisabled.value = true;
  //
  //     // Get.toNamed(Routes.connctionbar);
  //   }
  // }
}
