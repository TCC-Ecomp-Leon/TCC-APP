import 'package:get/get.dart';
import 'package:tcc_app/app/modules/cursos/modules/criacao_curso/criacao_curso_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

class CriacaoCursoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CriacaoCursoController>(() => CriacaoCursoController());
  }
}
