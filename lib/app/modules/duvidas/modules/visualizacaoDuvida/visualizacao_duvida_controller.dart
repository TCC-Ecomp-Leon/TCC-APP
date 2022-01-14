import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/models/Duvida.dart';
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

  atualizarDuvida({bool? notificar}) async {
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

  Duvida get duvida => _duvida.value;
  bool get atualizando => _atualizando.value;
  bool get enviandoMensagem => _enviandoMensagem.value;
  String? get erro => _erro.isEmpty ? null : _erro.value;
}
