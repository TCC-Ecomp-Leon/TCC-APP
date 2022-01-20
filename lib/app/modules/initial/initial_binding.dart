import 'package:get/get.dart';
import 'package:tcc_app/app/modules/initial/initial_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<InitialController>(InitialController());
  }
}
