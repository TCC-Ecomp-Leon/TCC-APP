import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/atividade.dart';

class ColaboracaoController extends BottomMenuController {
  @override
  void onInit() {
    super.onInit();
    _carregandoCursos.value = true;
    carregarCursos();
    carregarColaboracoes();
  }

  final CollectionsController collectionsController =
      Get.find<CollectionsController>();

  final Rx<bool> _carregandoCursos = false.obs;
  final Rx<bool> _carregandoColaboracoes = false.obs;
  final Rx<bool> _carregandoAtividadesColaboradas = false.obs;
  late Rx<AtividadeColaboradaCarregada> _atividadeColaboradaCarregada;
  final Rx<String> _erro = "".obs;
  final RxList<ColaboracaoAtividade> _colaboracoes =
      ([].map((e) => e as ColaboracaoAtividade).toList()).obs;

  final RxList<InformacoesCursoProjeto> _cursos = ([]
          .map(
            (e) => e as InformacoesCursoProjeto,
          )
          .toList())
      .obs;

  carregarCursos({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoCursos.value = true;
    }

    await collectionsController.carregarProjetos();

    final List<Projeto> projetosCarregados =
        collectionsController.projetos.map((e) => e).toList();
    List<InformacoesCursoProjeto> informacoes = [];

    for (int i = 0; i < projetosCarregados.length; i++) {
      final Projeto projeto = projetosCarregados[i];
      if (projeto.cursos != null) {
        for (int j = 0; j < projeto.cursos!.length; j++) {
          final Curso curso = projeto.cursos![j];
          informacoes.add(
            InformacoesCursoProjeto(
              nomeProjeto: projeto.nome,
              imagemProjeto: projeto.imgProjeto,
              curso: curso,
            ),
          );
        }
      }
    }

    _cursos.value = informacoes;

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoCursos.value = false;
    }
  }

  carregarColaboracoes({
    RefreshController? refreshController,
  }) async {
    if (refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoColaboracoes.value = true;
    }

    await loginController.recarregarPerfil();
    _colaboracoes.value =
        loginController.perfil.universitario!.atividadesQueColaborou!;

    if (refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoColaboracoes.value = false;
    }
  }

  carregarAtividadeColaborada(ColaboracaoAtividade colaboracao) async {
    _carregandoAtividadesColaboradas.value = true;

    final Atividade? atividade = await obterAtividade(colaboracao.idAtividade);
    if (atividade == null) {
      _erro.value = "Falha ao obter a atividade";
    } else {
      _erro.value = "";
      List<InformacoesCursoProjeto> cursos = _cursos.value
          .where((element) => element.curso.id == atividade.idCurso)
          .toList();
      if (cursos.isEmpty) {
        await carregarCursos();
      }
      cursos = _cursos.value
          .where((element) => element.curso.id == atividade.idCurso)
          .toList();

      _atividadeColaboradaCarregada = AtividadeColaboradaCarregada(
        atividade: atividade,
        curso: cursos[0].curso,
        nomeProjeto: cursos[0].nomeProjeto,
        imagemProjeto: cursos[0].imagemProjeto,
      ).obs;
    }

    _carregandoAtividadesColaboradas.value = false;
  }

  bool get carregandoCursos => _carregandoCursos.value;
  List<InformacoesCursoProjeto> get cursos => _cursos.value;
  Perfil get perfil => loginController.perfil;
  List<ColaboracaoAtividade> get colaboracoes => _colaboracoes.value;

  bool get carregandoAtividadesColaboradas =>
      _carregandoAtividadesColaboradas.value;
  AtividadeColaboradaCarregada get atividadeColaboradaCarregada =>
      _atividadeColaboradaCarregada.value;
  String? get erro => _erro.value.isEmpty ? null : _erro.value;
}

class InformacoesCursoProjeto {
  String nomeProjeto;
  String imagemProjeto;
  Curso curso;

  InformacoesCursoProjeto({
    required this.nomeProjeto,
    required this.imagemProjeto,
    required this.curso,
  });
}

class AtividadeColaboradaCarregada {
  String nomeProjeto;
  String imagemProjeto;
  Curso curso;
  Atividade atividade;

  AtividadeColaboradaCarregada({
    required this.nomeProjeto,
    required this.imagemProjeto,
    required this.curso,
    required this.atividade,
  });
}
