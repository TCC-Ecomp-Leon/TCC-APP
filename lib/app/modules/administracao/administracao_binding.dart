import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/administracao/administracao_controller.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class AdministracaoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AdministracaoController>(() => AdministracaoController());
  }
}
