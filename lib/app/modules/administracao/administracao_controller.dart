import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/codigoDeEntrada.dart';
import 'package:tcc_app/services/projeto.dart';

// Controlador para fornecer os estados da página que irá mostrar
// as informações de:
// (i) Se o usuário é do tipo projeto:
//        - Projeto
//        - Cursos do projeto
//        - Códigos de entrada

enum EstadoAdicaoCodigoDeEntrada {
  entradaUsuario,
  carregando,
  adicionado,
}

class AdministracaoController extends BottomMenuController {
  final collectionsController = Get.find<CollectionsController>();
  @override
  void onInit() {
    super.onInit();
    carregarCodigosDeEntrada();
    if (loginController.perfil.regra == RegraPerfil.Administrador) {
      _carregandoProjetosAprovados.value = true;
      _carregandoProjetosNaoAprovados.value = true;
      _carregandoCursosUniversitarios.value = true;
      carregarInformacoesAdm();
    }
  }

  carregarProjetosAprovados({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoProjetosAprovados.value = true;
    }

    await collectionsController.carregarProjetos();

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoProjetosAprovados.value = false;
    }
  }

  carregarProjetosNaoAprovados({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoProjetosNaoAprovados.value = true;
    }

    List<Projeto>? result = await obterListaDeProjetosNaoAprovados();

    if (result != null) {
      _projetosNaoAprovados.value = result;
    }

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoProjetosNaoAprovados.value = false;
    }
  }

  carregarCursosUniversitarios({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoCursosUniversitarios.value = true;
    }

    await collectionsController.carregarCursosUniversitarios();

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoCursosUniversitarios.value = false;
    }
  }

  carregarInformacoesAdm() async {
    await carregarProjetosAprovados();

    await carregarProjetosNaoAprovados();

    await carregarCursosUniversitarios();
  }

  final Rx<bool> _carregandoProjetosAprovados = false.obs;
  final Rx<bool> _carregandoProjetosNaoAprovados = false.obs;
  final Rx<bool> _carregandoCursosUniversitarios = false.obs;
  final Rx<bool> _aprovandoProjeto = false.obs;
  final RxList<dynamic> _projetosNaoAprovados = [].obs;

  final Rx<bool> _carregandoCodigosDeEntrada = false.obs;
  final RxList<dynamic> _codigosDeEntrada = [].obs;

  final Rx<EstadoAdicaoCodigoDeEntrada> _estadoAdicaoCodigo =
      EstadoAdicaoCodigoDeEntrada.entradaUsuario.obs;
  final Rx<bool> _codigoParaProfessor = false.obs;
  final Rx<int> _indiceCursoSelecionado = (-1).obs;
  final Rx<int> _indiceMateriaSeleciona = (-1).obs;
  final Rx<String> _codigoGerado = "".obs;
  final Rx<String> _erroAdicaoCodigoDeEntrada = "".obs;

  aprovarProjeto(Projeto projeto) async {
    if (!projeto.aprovado) {
      _aprovandoProjeto.value = true;

      bool? result = await aprovacaoProjeto(projeto.id);
      if (result != null && result) {
        Get.back();
        carregarInformacoesAdm();
      }

      _aprovandoProjeto.value = false;
    }
  }

  carregarCodigosDeEntrada({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoCodigosDeEntrada.value = true;
    }

    List<CodigoEntrada>? result = await obterCodigosDeEntrada();
    if (result != null) {
      _codigosDeEntrada.value = result;
    }

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoCodigosDeEntrada.value = false;
    }
  }

  List<Materia> _materiasCursoSelecionado() {
    int cursoSelecionado = _indiceCursoSelecionado.value;
    if (indiceCursoSelecionado == -1) return [];

    return cursos[cursoSelecionado].materias;
  }

  alterarCodigoParaProfessor() {
    _codigoParaProfessor.value = !_codigoParaProfessor.value;
  }

  entrarEmModoDeAdicaoCodigo() {
    _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.entradaUsuario;
    _codigoGerado.value = "";
  }

  sairModoAdicaoCodigo(RefreshController refreshController) {
    Get.back();
    carregarCodigosDeEntrada(
      refreshController: refreshController,
    );
  }

  adicionarCodigo() async {
    if (_indiceCursoSelecionado.value == -1 ||
        (_indiceMateriaSeleciona.value == -1 && _codigoParaProfessor.value)) {
      return;
    }

    _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.carregando;

    CodigoEntrada? result = await registrarCodigoDeEntrada(
      _codigoParaProfessor.value
          ? TipoCodigoDeEntrada.Professor
          : TipoCodigoDeEntrada.Aluno,
      cursos[_indiceCursoSelecionado.value].id,
      _codigoParaProfessor.value
          ? materiasCurso[_indiceCursoSelecionado.value].id
          : null,
    );
    if (result != null) {
      _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.adicionado;
      _codigoGerado.value = result.id;
    } else {
      _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.entradaUsuario;
      _erroAdicaoCodigoDeEntrada.value =
          "Erro ao adicionar o código de entrada";
    }
  }

  abrirMateria() {}

  abrirCodigo() {}

  Projeto get projeto => loginController.authInfo.projeto!;
  List<Curso> get cursos => loginController.authInfo.projeto!.cursos == null
      ? []
      : loginController.authInfo.projeto!.cursos!;
  List<Materia> get materiasCurso => _materiasCursoSelecionado();
  List<CodigoEntrada> get codigosDeEntrada =>
      // ignore: invalid_use_of_protected_member
      _codigosDeEntrada.value.map((e) => e as CodigoEntrada).toList();
  bool get carregandoCodigosDeEntrada => _carregandoCodigosDeEntrada.value;

  bool get codigoParaProfessor => _codigoParaProfessor.value;
  int get indiceCursoSelecionado => _indiceCursoSelecionado.value;
  int get indiceMateriaSelecionada => _indiceMateriaSeleciona.value;

  selecionarCurso(int index) {
    _indiceCursoSelecionado.value = index;
    _indiceMateriaSeleciona.value = -1;
  }

  selecionarMateria(int index) {
    _indiceMateriaSeleciona.value = index;
  }

  String? get codigoGerado =>
      _codigoGerado.value.isEmpty ? null : _codigoGerado.value;
  EstadoAdicaoCodigoDeEntrada get estadoAdicaoCodigo =>
      _estadoAdicaoCodigo.value;
  String? get erroAdicaoCodigoDeEntrada =>
      _erroAdicaoCodigoDeEntrada.value.isEmpty
          ? null
          : _erroAdicaoCodigoDeEntrada.value;

  bool get carregandoProjetosAprovados => _carregandoProjetosAprovados.value;
  bool get carregandoProjetosNaoAprovados =>
      _carregandoProjetosNaoAprovados.value;
  bool get aprovandoProjeto => _aprovandoProjeto.value;

  List<Projeto> get projetosAprovados => collectionsController.projetos;
  List<Projeto> get projetosNaoAprovados =>
      // ignore: invalid_use_of_protected_member
      _projetosNaoAprovados.value.map((e) => e as Projeto).toList();

  bool get carregandoCursosUniversitarios =>
      _carregandoCursosUniversitarios.value;
  List<CursoUniversitario> get cursosUniversitarios =>
      collectionsController.cursosUniversitarios;
}
