import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/models/Materia.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/utils/flatten.dart';

//Prover as informações sobre os cursos para as diferentes views
//  1 - Projeto: Listar os cursos do projeto
//  2 - Geral:
//      (i) Professor: Lista de cursos que ele tem matérias
//      (ii) Aluno: Lista de cursos que ele participa

class CursosController extends BottomMenuController {
  final CollectionsController collectionsController =
      Get.find<CollectionsController>();

  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    carregarListaCursos();
  }

  final RxList<dynamic> _cursos = [].obs;
  final Rx<bool> _carregandoCursos = true.obs;

  carregarListaCursos({bool? notSilent, bool? force}) async {
    if (notSilent != null && notSilent) {
      refreshController.requestRefresh();
    }
    _carregandoCursos.value = true;

    if (regraProjeto) {
      if (force != null && force) {
        await loginController.recarregarProjeto();
      }
      _cursos.value = projeto!.cursos!;
    } else if (regraAluno) {
      if (force != null && force) {
        await loginController.recarregarPerfil();
      }
      _cursos.value = perfil.associacoes!.aluno.cursos!;
    } else if (regraProfessor) {
      _cursos.value = await _buscarCursosProfessor();
    }

    _carregandoCursos.value = false;
    if (notSilent != null && notSilent) {
      refreshController.refreshCompleted();
    }
  }

  Future<List<Curso>> _buscarCursosProfessor() async {
    List<Curso> cursos = [];
    List<Materia> materiasProfessor =
        perfil.associacoes!.professor.materiasProfessor!;
    bool pesquisaRealizada = false;
    for (int i = 0; i < materiasProfessor.length; i++) {
      Curso? curso = _buscarCursoBaseadoNaMateria(materiasProfessor[i].id);
      if (curso == null && pesquisaRealizada == false) {
        await collectionsController.carregarProjetos();
        pesquisaRealizada = true;
        curso = _buscarCursoBaseadoNaMateria(materiasProfessor[i].id);
      }
      if (curso != null) {
        cursos.add(curso);
      }
    }
    return [];
  }

  Curso? _buscarCursoBaseadoNaMateria(String idMateria) {
    List<Projeto> projetos = collectionsController.projetosCarregados
        .getItems()
        .map((e) => e.projeto)
        .toList();
    List<Curso> cursos = flattenDeep(projetos.map((e) => e.cursos).toList());
    List<Materia> materias =
        flattenDeep(cursos.map((e) => e.materias).toList());
    List<Materia> materiasEncontradas =
        materias.where((element) => element.id == idMateria).toList();
    if (materiasEncontradas.isEmpty) {
      return null;
    }

    Materia materia = materiasEncontradas[0];
    List<Curso> cursoEncontrado =
        cursos.where((element) => element.id == materia.idCurso).toList();
    if (cursoEncontrado.isEmpty) {
      return null;
    }
    return cursoEncontrado[0];
  }

  Perfil get perfil => loginController.perfil;
  Projeto? get projeto => loginController.projeto;
  List<Curso> get cursos => _cursos.map((element) => element as Curso).toList();
  bool get carregandoCursos => _carregandoCursos.value;

  bool get regraAdministrador => loginController.regraAdministrador;
  bool get regraProjeto => loginController.regraProjeto;
  bool get regraAluno => loginController.regraAluno;
  bool get regraProfessor => loginController.regraProfessor;
  bool get regraUniversitario => loginController.regraUniversitario;
}
