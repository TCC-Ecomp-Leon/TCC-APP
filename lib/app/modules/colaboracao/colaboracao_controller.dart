import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
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
  late Rx<Atividade> _atividadeColaboradaCarregada;
  final Rx<String> _erro = "".obs;

  final RxList<InformacoesCursoProjeto> _cursos = ([]
          .map(
            (e) => e as InformacoesCursoProjeto,
          )
          .toList())
      .obs;

  carregarCursos({
    bool? pullRefresh,
    RefreshController? refreshController,
  }) async {
    if (pullRefresh != null && pullRefresh && refreshController != null) {
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

    if (pullRefresh != null && pullRefresh && refreshController != null) {
      refreshController.refreshCompleted();
    } else {
      _carregandoCursos.value = false;
    }
  }

  carregarColaboracoes({
    bool? pullRefresh,
    RefreshController? refreshController,
  }) async {
    if (pullRefresh != null && pullRefresh && refreshController != null) {
      refreshController.requestRefresh();
    } else {
      _carregandoColaboracoes.value = true;
    }

    await loginController.recarregarPerfil();

    if (pullRefresh != null && pullRefresh && refreshController != null) {
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
      _atividadeColaboradaCarregada.value = atividade;
    }

    _carregandoAtividadesColaboradas.value = false;
  }

  bool get carregandoCursos => _carregandoCursos.value;
  List<InformacoesCursoProjeto> get cursos => _cursos.value;
  Perfil get perfil => loginController.perfil;
  List<ColaboracaoAtividade> get colaboracoes =>
      loginController.perfil.universitario!.atividadesQueColaborou!;

  bool get carregandoAtividadesColaboradas =>
      _carregandoAtividadesColaboradas.value;
  Atividade get atividadeColaboradaCarregada =>
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
