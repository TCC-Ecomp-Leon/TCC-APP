import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/modules/adicao_materia_controller.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class AdicaoMateriaBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.lazyPut<AdicaoMateriaController>(() => AdicaoMateriaController());
  }
}
