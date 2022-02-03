import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/services/curso.dart';

class AdicaoMateriaController extends GetxController {
  late Curso curso;

  @override
  void onInit() {
    super.onInit();
    curso = Get.arguments as Curso;
  }

  final TextEditingController nome = TextEditingController();
  final TextEditingController descricao = TextEditingController();

  final Rx<bool> _adicionando = false.obs;
  final Rx<String> _erro = "".obs;

  bool validate() {
    if (nome.text.isEmpty) return false;
    if (descricao.text.isEmpty) return false;

    return true;
  }

  adicaoMateria() async {
    _adicionando.value = true;

    bool? result = await adicionarMateria(
        curso.idProjeto, curso.id, nome.text, descricao.text);
    if (result != null && result) {
      _erro.value = "";
    } else {
      _erro.value = "Erro ao adicionar a matéria";
    }

    _adicionando.value = false;

    if (_erro.value.isEmpty) {
      Get.back();
    }
  }

  bool get adicionando => _adicionando.value;
  String? get erro => _erro.value.isEmpty ? null : _erro.value;
}
