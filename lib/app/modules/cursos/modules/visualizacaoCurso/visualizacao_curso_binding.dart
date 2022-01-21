import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class VisualizacaoCursoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.lazyPut<VisualizacaoCursoController>(
        () => VisualizacaoCursoController());
  }
}
