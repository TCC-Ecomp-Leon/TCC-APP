import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/cursos/cursos_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class CursosBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CursosController>(() => CursosController());
  }
}
