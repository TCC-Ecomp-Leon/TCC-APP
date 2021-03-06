import 'package:tcc_app/app/modules/administracao/administracao_binding.dart';
import 'package:tcc_app/app/modules/administracao/administracao_view.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_binding.dart';
import 'package:tcc_app/app/modules/administracao/modules/adicao_curso_universitario_view.dart';
import 'package:tcc_app/app/modules/colaboracao/colaboracao_binding.dart';
import 'package:tcc_app/app/modules/colaboracao/colaboracao_view.dart';
import 'package:tcc_app/app/modules/cursos/cursos_binding.dart';
import 'package:tcc_app/app/modules/cursos/cursos_view.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_binding.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/atividade_view.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/modules/respostas_binding.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/modules/respostas_view.dart';
import 'package:tcc_app/app/modules/cursos/modules/criacao_curso/criacao_curso_binding.dart';
import 'package:tcc_app/app/modules/cursos/modules/criacao_curso/criacao_curso_view.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/modules/adicao_materia_binding.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/modules/adicao_materia_view.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_binding.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/visualizacao_curso_view.dart';
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
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.colaboracao,
      page: () => ColaboracaoView(),
      binding: ColaboracaoBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.perfil,
      page: () => const PerfilView(),
      binding: PerfilBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.perfil,
      page: () => const PerfilView(),
      binding: PerfilBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.duvidas,
      page: () => const DuvidasView(),
      binding: DuvidasBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.cursos,
      page: () => const CursosView(),
      binding: CursosBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.criacaoDuvida,
      page: () => const CriacaoDuvidaView(),
      binding: CriacaoDuvidaBinding(),
    ),
    GetPage(
      name: Routes.administracao,
      page: () => AdministracaoView(),
      binding: AdministracaoBinding(),
    ),
    GetPage(
      name: Routes.adicaoCursoUniversitario,
      page: () => const AdicaoCursoUniversitarioView(),
      binding: AdicaoCursoUniversitarioBinding(),
    ),
    GetPage(
      name: Routes.visualizacaoDuvida,
      page: () => VisualizacaoDuvidaView(),
      binding: VisualizacaoDuvidaBinding(),
    ),
    GetPage(
      name: Routes.criacaoCurso,
      page: () => const CriacaoCursoView(),
      binding: CriacaoCursoBinding(),
    ),
    GetPage(
      name: Routes.visualizacaoCurso,
      page: () => const VisualizacaoCursoView(),
      binding: VisualizacaoCursoBinding(),
    ),
    GetPage(
      name: Routes.atividade,
      page: () => const AtividadeView(),
      binding: AtividadeBinding(),
    ),
    GetPage(
      name: Routes.respostasAtividade,
      page: () => const RespostasView(),
      binding: RespostasBinding(),
    ),
    GetPage(
      name: Routes.adicaoMateria,
      page: () => const AdicaoMateriaView(),
      binding: AdicaoMateriaBinding(),
    ),
  ];
}
