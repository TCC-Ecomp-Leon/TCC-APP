import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signUp/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
