import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/duvida.dart';

class VisualizacaoDuvidaController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _duvida = (Get.arguments as Duvida).obs;
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

  Duvida get duvida => _duvida.value;
  bool get atualizando => _atualizando.value;
  bool get enviandoMensagem => _enviandoMensagem.value;
  String? get erro => _erro.isEmpty ? null : _erro.value;
}
