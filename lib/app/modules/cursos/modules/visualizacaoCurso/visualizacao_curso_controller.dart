import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/cursos/modules/visualizacaoCurso/modules/adicao_materia_view.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/atividade.dart';
import 'package:tcc_app/services/curso.dart';
import 'package:tcc_app/services/projeto.dart';
import 'package:tcc_app/services/respostaAtividade.dart';

class VisualizacaoCursoController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();

  late Rx<Curso> _curso;

  final RxList<dynamic> _atividades = [].obs;
  final Rx<bool> _carregandoAtividades = false.obs;
  late RxMap<String, List<RespostaAtividade>> mapaRespostasAtividades;

  @override
  void onInit() {
    super.onInit();
    Curso curso = Get.arguments as Curso;
    _curso = curso.obs;
    inicializarVariaveisCurso(curso);
    _carregandoAtividades.value = true;
    carregarAtividades();
  }

  Future<void> carregarAtividades(
      {bool? pullRefresh,
      RefreshController? refreshControllerAtividades}) async {
    if (pullRefresh == null || pullRefresh == false) {
      _carregandoAtividades.value = true;
    } else if (refreshControllerAtividades != null) {
      refreshControllerAtividades.requestRefresh();
    }
    List<Atividade>? result = await obterListaDeAtividades(
      curso.id,
      visualizandoTodas
          ? null
          : visualizandoAbertas
              ? true
              : false,
    );
    if (result != null) {
      Map<String, List<RespostaAtividade>> map = {};
      for (int i = 0; i < result.length; i++) {
        Atividade atividade = result[i];
        List<RespostaAtividade>? respostas =
            await lerRespostasPerfilEmAtividade(
          loginController.perfil.id,
          atividade.id,
        );
        if (respostas != null) {
          map[atividade.id] = respostas;
        }
      }

      mapaRespostasAtividades = map.obs;

      _atividades.value = result;
    }

    if (pullRefresh == null || pullRefresh == false) {
      _carregandoAtividades.value = false;
    } else if (refreshControllerAtividades != null) {
      refreshControllerAtividades.refreshCompleted();
    }
  }

  inicializarVariaveisCurso(Curso curso) {
    nomeCurso = TextEditingController(text: curso.nome);
    descricaoCurso = TextEditingController(text: curso.descricao);
    _inicioCurso = curso.inicioCurso.obs;
    _fimCurso = curso.fimCurso.obs;
  }

  recarregarCurso({RefreshController? refreshControllerCursoMaterias}) async {
    if (refreshControllerCursoMaterias != null) {
      refreshControllerCursoMaterias.requestRefresh();
    }

    final Projeto? projeto = await obterProjeto(curso.idProjeto);
    if (projeto != null) {
      loginController.projeto = projeto;

      if (projeto.cursos != null) {
        List<Curso> acharCursoAtualizado =
            projeto.cursos!.where((element) => element.id == curso.id).toList();
        if (acharCursoAtualizado.isNotEmpty) {
          Curso curso = acharCursoAtualizado[0];
          _curso.value = curso;
          inicializarVariaveisCurso(curso);
        }
      }
    }

    await carregarAtividades();

    if (refreshControllerCursoMaterias != null) {
      refreshControllerCursoMaterias.refreshCompleted();
    }
  }

  late TextEditingController nomeCurso;
  final Rx<String> _nomeCursoErro = "".obs;
  late TextEditingController descricaoCurso;
  final Rx<String> _descricaoCursoErro = "".obs;
  late Rx<DateTime> _inicioCurso;
  late Rx<DateTime> _fimCurso;

  final Rx<String> _erro = "".obs;

  bool validarNomeCurso() {
    return nomeCurso.text.isNotEmpty;
  }

  onChangeNomeCurso() {
    if (!validarNomeCurso()) {
      _nomeCursoErro.value = "Nome inv??lido";
    } else {
      _nomeCursoErro.value = "";
    }
  }

  bool validarDescricaoCurso() {
    return descricaoCurso.text.isNotEmpty;
  }

  onChangeDescricaoCurso() {
    if (!validarDescricaoCurso()) {
      _descricaoCursoErro.value = "Descri????o inv??lida";
    } else {
      _descricaoCursoErro.value = "";
    }
  }

  setInicioCurso(DateTime dateTime) {
    _inicioCurso.value = dateTime;
  }

  setFimCurso(DateTime dateTime) {
    _fimCurso.value = dateTime;
  }

  salvarEdicaoCurso() async {
    if (_salvandoEdicaoCurso.value) return;

    _salvandoEdicaoCurso.value = true;

    onChangeNomeCurso();
    onChangeDescricaoCurso();

    if (nomeCursoErro == null && descricaoCursoErro == null) {
      String nome = nomeCurso.text;
      String descricao = descricaoCurso.text;

      final bool? result = await atualizarCurso(
        curso.idProjeto,
        curso.id,
        nome,
        descricao,
        inicioCurso,
        fimCurso,
        materias,
      );
      if (result != null && result) {
        _editandoCurso.value = false;
        _erro.value = "";
      } else {
        _erro.value = "Erro ao atualizar o curso";
      }
    }

    _salvandoEdicaoCurso.value = false;
    if (_erro.value.isEmpty) {
      recarregarCurso();
    }
  }

  entrarModoEdicaoCurso() {
    _editandoCurso.value = true;
  }

  sairModoEdicaoCurso() {
    _editandoCurso.value = false;
    inicializarVariaveisCurso(curso);
  }

  chamarPaginaAdicaoMateria() async {
    await Get.toNamed(Routes.adicaoMateria, arguments: curso);
    recarregarCurso();
  }

  final Rx<bool> _editandoCurso = false.obs;
  final Rx<bool> _salvandoEdicaoCurso = false.obs;

  bool get permissaoEditar =>
      loginController.projeto?.id == _curso.value.idProjeto;
  bool get permissaoAdicionarMateria =>
      loginController.perfil.regra == RegraPerfil.Projeto;
  Curso get curso => _curso.value;
  List<Materia> get materias => _curso.value.materias;

  bool get editandoCurso => _editandoCurso.value;
  bool get salvandoEdicaoCurso => _salvandoEdicaoCurso.value;

  String? get nomeCursoErro =>
      _nomeCursoErro.value.isEmpty ? null : _nomeCursoErro.value;
  String? get descricaoCursoErro =>
      _descricaoCursoErro.value.isEmpty ? null : _descricaoCursoErro.value;
  DateTime get inicioCurso => _inicioCurso.value;
  DateTime get fimCurso => _fimCurso.value;

  String? get erro => _erro.value.isEmpty ? null : _erro.value;
  bool get carregandoAtividades => _carregandoAtividades.value;
  List<Atividade> get atividades =>
      _atividades.map((element) => element as Atividade).toList();

  final Rx<TipoAtividadeVisualizando> _tipoAtividadeVisualizando =
      TipoAtividadeVisualizando.abertas.obs;

  visualizarAbertas(RefreshController refreshController) {
    _tipoAtividadeVisualizando.value = TipoAtividadeVisualizando.abertas;
    carregarAtividades();
  }

  visualizarFechadas(RefreshController refreshController) {
    _tipoAtividadeVisualizando.value = TipoAtividadeVisualizando.fechadas;
    carregarAtividades();
  }

  visualizarTodas(RefreshController refreshController) {
    _tipoAtividadeVisualizando.value = TipoAtividadeVisualizando.todas;
    carregarAtividades();
  }

  bool get visualizandoAbertas =>
      _tipoAtividadeVisualizando.value == TipoAtividadeVisualizando.abertas;
  bool get visualizandoFechadas =>
      _tipoAtividadeVisualizando.value == TipoAtividadeVisualizando.fechadas;
  bool get visualizandoTodas =>
      _tipoAtividadeVisualizando.value == TipoAtividadeVisualizando.todas;

  bool get permissaoCriarAtividade => permissaoEditar;

  DateTime referenciaTempoFecharAtividade(Atividade atividade) {
    final Perfil perfil = loginController.perfil;
    if (perfil.regra == RegraPerfil.Projeto) {
      if (atividade.tipoAtividade == TipoAtividade.Dissertativa) {
        return atividade.fechamentoCorrecoes!;
      }
    } else {
      if (perfil.universitario?.universitario == true) {
        if (atividade.tipoAtividade == TipoAtividade.Dissertativa) {
          return atividade.fechamentoCorrecoes!;
        }
      }
    }
    return atividade.fechamentoRespostas;
  }

  List<RespostaAtividade> respostasUsuarioAtividade(String idAtividade) {
    if (mapaRespostasAtividades.keys.contains(idAtividade)) {
      return mapaRespostasAtividades[idAtividade]!;
    }
    return [];
  }

  bool get regraAdministrador => loginController.regraAdministrador;
  bool get regraProjeto => loginController.regraProjeto;
  bool get regraAluno => loginController.regraAluno;
  bool get regraProfessor => loginController.regraProfessor;
  bool get regraUniversitario => loginController.regraUniversitario;
}

enum TipoAtividadeVisualizando {
  abertas,
  fechadas,
  todas,
}
