import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/modules/respostas_controller.dart';

class RespostasBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<RespostasController>(() => RespostasController());
  }
}
