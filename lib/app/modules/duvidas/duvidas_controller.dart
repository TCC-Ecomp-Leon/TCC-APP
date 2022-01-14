import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/Duvida.dart';
import 'package:tcc_app/services/duvida.dart';

class DuvidasController extends BottomMenuController {
  final RxList<dynamic> _duvidas = [].obs;
  final Rx<bool> _carregando = false.obs;

  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    carregarDuvidas();
  }

  carregarDuvidas({bool? pullRefresh}) async {
    if (pullRefresh != null && pullRefresh) {
      refreshController.requestRefresh();
    } else {
      _carregando.value = true;
    }

    List<Duvida>? result = await obterDuvidas(null);
    if (result != null) {
      _duvidas.value = result;
      _duvidas.refresh();
    }

    if (pullRefresh != null && pullRefresh) {
      refreshController.refreshCompleted();
    } else {
      _carregando.value = false;
    }
  }

  List<Duvida> get duvidas => _duvidas.value.map((e) => e as Duvida).toList();
  bool get carregandoDuvidas => _carregando.value;

  bool get aluno =>
      loginController.perfil.associacoes?.aluno.alunoParceiro == true;
}
