import 'package:tcc_app/app/modules/administracao/administracao_binding.dart';
import 'package:tcc_app/app/modules/administracao/administracao_view.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_binding.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_view.dart';
import 'package:tcc_app/app/modules/cursos/cursos_binding.dart';
import 'package:tcc_app/app/modules/cursos/cursos_view.dart';
import 'package:tcc_app/app/modules/dummy/dummy_binding.dart';
import 'package:tcc_app/app/modules/dummy/dummy_view.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_binding.dart';
import 'package:tcc_app/app/modules/duvidas/duvidas_view.dart';
import 'package:tcc_app/app/modules/duvidas/modules/criacaoDuvida/criacao_duvida_binding.dart';
import 'package:tcc_app/app/modules/duvidas/modules/criacaoDuvida/criacao_duvida_view.dart';
import 'package:tcc_app/app/modules/duvidas/modules/visualizacaoDuvida/visualizacao_duvida_binding.dart';
import 'package:tcc_app/app/modules/duvidas/modules/visualizacaoDuvida/visualizacao_duvida_view.dart';
import 'package:tcc_app/app/modules/initial/initial_binding.dart';
import 'package:tcc_app/app/modules/initial/initial_view.dart';
import 'package:tcc_app/app/modules/perfil/perfil_binding.dart';
import 'package:tcc_app/app/modules/perfil/perfil_view.dart';
import 'package:tcc_app/app/modules/signIn/login_binding.dart';
import 'package:tcc_app/app/modules/signIn/login_view.dart';
import 'package:tcc_app/app/modules/signUp/signup_binding.dart';
import 'package:tcc_app/app/modules/signUp/signup_view.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.initial;

  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.dummy,
      page: () => DummyView(),
      binding: DummyBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.perfil,
      page: () => PerfilView(),
      binding: PerfilBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.perfil,
      page: () => PerfilView(),
      binding: PerfilBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.duvidas,
      page: () => DuvidasView(),
      binding: DuvidasBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.cursos,
      page: () => CursosView(),
      binding: CursosBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.criacaoDuvida,
      page: () => CriacaoDuvidaView(),
      binding: CriacaoDuvidaBinding(),
    ),
    GetPage(
      name: Routes.administracao,
      page: () => AdministracaoView(),
      binding: AdministracaoBinding(),
    ),
    GetPage(
      name: Routes.adicaoCursoUniversitario,
      page: () => AdicaoCursoUniversitarioView(),
      binding: AdicaoCursoUniversitarioBinding(),
    ),
    GetPage(
      name: Routes.visualizacaoDuvida,
      page: () => VisualizacaoDuvidaView(),
      binding: VisualizacaoDuvidaBinding(),
    ),
  ];
}
