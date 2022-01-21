import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_controller.dart';

class AtividadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<AtividadeController>(() => AtividadeController());
  }
}
