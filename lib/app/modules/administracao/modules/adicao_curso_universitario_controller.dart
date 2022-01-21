import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/cursoUniversitario.dart';

class AdicaoCursoUniversitarioController extends GetxController {
  final CollectionsController collectionsController =
      Get.find<CollectionsController>();

  final Rx<bool> _adicionandoCurso = false.obs;
  final Rx<String> _erro = "".obs;

  final TextEditingController nome = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController semestresPrevistos = TextEditingController();

  final Rx<int> _indiceCursoAnterior = (-1).obs;

  bool validarNome() {
    return nome.text.isNotEmpty;
  }

  bool validarDescricao() {
    return descricao.text.isNotEmpty;
  }

  bool validarSemestresPrevistos() {
    int? semestres = int.tryParse(semestresPrevistos.text);
    return semestres != null && semestres > 0;
  }

  void selecionarCurso(int index) {
    _indiceCursoAnterior.value = index;
  }

  Future<void> adicionarCurso() async {
    if (!nomeValido ||
        !descricaoValida | !semestresValidos ||
        _adicionandoCurso.value) {
      return;
    }
    _adicionandoCurso.value = true;

    final bool? result = await registrarCursoUniversitario(
      nome.text,
      descricao.text,
      int.parse(semestresPrevistos.text),
      _indiceCursoAnterior.value > -1
          ? cursosUniversitarios[_indiceCursoAnterior.value]
          : null,
    );

    if (result != null && result) {
      Get.back();
    } else {
      _erro.value = "Erro ao adicionar o curso";
    }

    _adicionandoCurso.value = false;
  }

  final Rx<bool> _nomeValido = false.obs;
  void onChangeNome() {
    _nomeValido.value = validarNome();
  }

  final Rx<bool> _descricaoValida = false.obs;
  void onChangeDescricao() {
    _descricaoValida.value = validarDescricao();
  }

  final Rx<bool> _semestresValidos = false.obs;
  void onChangeSemestres() {
    _semestresValidos.value = validarSemestresPrevistos();
  }

  bool get adicionandoCurso => _adicionandoCurso.value;
  String? get erro => _erro.value.isNotEmpty ? _erro.value : null;
  List<CursoUniversitario> get cursosUniversitarios =>
      collectionsController.cursosUniversitarios;
  int get indiceCursoAnterior => _indiceCursoAnterior.value;

  bool get nomeValido => _nomeValido.value;
  bool get descricaoValida => _descricaoValida.value;
  bool get semestresValidos => _semestresValidos.value;
}
