import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/colaboracao/colaboracao_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class ColaboracaoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<ColaboracaoController>(() => ColaboracaoController());
  }
}
