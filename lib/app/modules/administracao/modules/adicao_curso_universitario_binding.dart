import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class AdicaoCursoUniversitarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<CollectionsController>(CollectionsController());
    Get.lazyPut<AdicaoCursoUniversitarioController>(
        () => AdicaoCursoUniversitarioController());
  }
}
