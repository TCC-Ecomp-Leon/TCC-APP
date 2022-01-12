import 'package:get/get.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class DuvidasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DuvidasController>(() => DuvidasController());
  }
}
