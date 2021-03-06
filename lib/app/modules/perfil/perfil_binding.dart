import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/perfil/perfil_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class PerfilBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CollectionsController());
    Get.put<LoginController>(LoginController());
    Get.lazyPut<PerfilController>(() => PerfilController());
  }
}
