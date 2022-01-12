import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/dummy/dummy_controller.dart';
import 'package:tcc_app/app/modules/duvidas/modules/criacaoDuvida/criacao_duvida_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class CriacaoDuvidaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CollectionsController>(() => CollectionsController());
    Get.lazyPut<CriacaoDuvidaController>(() => CriacaoDuvidaController());
  }
}