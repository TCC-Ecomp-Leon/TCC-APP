import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
