import 'package:get/get.dart';
import 'package:tcc_app/app/modules/initial/initial_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
