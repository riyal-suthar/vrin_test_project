import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  static ControllerLogin get to => Get.isRegistered<ControllerLogin>() ? Get.find() : Get.put(ControllerLogin());
}
