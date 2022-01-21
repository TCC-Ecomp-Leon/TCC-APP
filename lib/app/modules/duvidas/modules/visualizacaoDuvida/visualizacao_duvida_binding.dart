import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_controller.dart';
import 'package:tcc_app/app/modules/duvidas/modules/visualizacaoDuvida/visualizacao_duvida_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class VisualizacaoDuvidaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CollectionsController>(CollectionsController());
    Get.put<LoginController>(LoginController());
    Get.lazyPut<VisualizacaoDuvidaController>(
      () => VisualizacaoDuvidaController(),
    );
  }
}
