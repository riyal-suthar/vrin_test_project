import 'package:get/get.dart';

class ControllerRoot extends GetxController {
  static ControllerRoot get to => Get.isRegistered<ControllerRoot>() ? Get.find() : Get.put(ControllerRoot());
}
