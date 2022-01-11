import 'package:get/get.dart';
import 'package:tcc_app/app/modules/dummy/dummy_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class DummyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DummyController>(() => DummyController());
  }
}
