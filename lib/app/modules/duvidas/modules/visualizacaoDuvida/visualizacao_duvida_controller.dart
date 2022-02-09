import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/duvida.dart';
import 'package:tcc_app/services/perfil.dart';

class VisualizacaoDuvidaController extends GetxController {
  final CollectionsController collectionsController =
      Get.find<CollectionsController>();
  final LoginController loginController = Get.find<LoginController>();

  @override
  void onInit() {
    super.onInit();
    _duvida = (Get.arguments as Duvida).obs;
    carregarPerfisMensagens();
  }

  final TextEditingController mensagem = TextEditingController();

  final Rx<bool> _atualizando = false.obs;
  final Rx<bool> _enviandoMensagem = false.obs;
  final Rx<String> _erro = "".obs;
  late Rx<Duvida> _duvida;

  final RefreshController refreshController = RefreshController();

  atualizarDuvida({bool? notificar}) async {
    refreshController.requestRefresh();
    if (notificar != null && notificar) {
      _atualizando.value = true;
    }

    Duvida? reload = await obterDuvida(duvida.id);
    if (reload != null) {
      _duvida.value = reload;
    }

    if (notificar != null && notificar) {
      _atualizando.value = false;
    }
    refreshController.refreshCompleted();
    carregarPerfisMensagens();
  }

  enviarMensagem() async {
    if (mensagem.text.isNotEmpty) {
      _enviandoMensagem.value = true;
      final bool? result = await responderDuvida(
        _duvida.value.id,
        mensagem.text,
      );

      if (result != null && result) {
        _erro.value = "";
        mensagem.text = "";
      } else {
        _erro.value = "Erro ao enviar a mensagem";
      }

      _enviandoMensagem.value = false;
      atualizarDuvida(notificar: false);
    }
  }

  fechamentoDuvida() async {
    _enviandoMensagem.value = true;

    final bool? result = await fecharDuvida(duvida.id);
    if (result != null && result) {
      _erro.value = "";
    } else {
      _erro.value = "Erro ao fechar a dúvida";
    }

    _enviandoMensagem.value = false;

    atualizarDuvida(notificar: false);
  }

  final Rx<bool> _carregandoPerfis = false.obs;
  final RxMap<String, Perfil> _perfisMensagens = <String, Perfil>{}.obs;

  carregarPerfisMensagens() async {
    _carregandoPerfis.value = true;

    Map<String, Perfil> map = {};
    for (int i = 0; i < duvida.mensagens.length; i++) {
      final idPerfil = duvida.mensagens[i].idPerfil;
      if (!map.keys.contains(idPerfil)) {
        Perfil? perfil;
        if (idPerfil == loginController.perfil.id) {
          perfil = loginController.perfil;
        } else {
          final Perfil? busca = await obterOutroPerfil(idPerfil);
          if (busca != null) {
            perfil = busca;
          }
        }
        if (perfil != null) {
          map[perfil.id] = perfil;
        }
      }
    }

    _perfisMensagens.value = map;
    _perfisMensagens.refresh();

    _carregandoPerfis.value = false;
    _carregandoPerfis.refresh();
  }

  Duvida get duvida => _duvida.value;
  bool get atualizando => _atualizando.value;
  bool get enviandoMensagem => _enviandoMensagem.value;
  String? get erro => _erro.isEmpty ? null : _erro.value;
  bool get carregandoPerfis => _carregandoPerfis.value;
  // ignore: invalid_use_of_protected_member
  Map<String, Perfil> get perfisMensagens => _perfisMensagens.value;
}
