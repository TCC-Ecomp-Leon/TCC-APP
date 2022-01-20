import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/index.dart';

class ColaboracaoController extends BottomMenuController {
  @override
  void onInit() {
    super.onInit();
    _carregando.value = true;
    carregarCursos();
  }

  final CollectionsController collectionsController =
      Get.find<CollectionsController>();

  final RefreshController refreshController = RefreshController();

  final Rx<bool> _carregando = false.obs;
  final RxList<InformacoesCursoProjeto> _cursos = ([]
          .map(
            (e) => e as InformacoesCursoProjeto,
          )
          .toList())
      .obs;

  carregarCursos({bool? pullRefresh}) async {
    if (pullRefresh != null && pullRefresh) {
      refreshController.requestRefresh();
    } else {
      _carregando.value = true;
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

    if (pullRefresh != null && pullRefresh) {
      refreshController.refreshCompleted();
    } else {
      _carregando.value = false;
    }
  }

  bool get carregando => _carregando.value;
  List<InformacoesCursoProjeto> get cursos => _cursos.value;
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
