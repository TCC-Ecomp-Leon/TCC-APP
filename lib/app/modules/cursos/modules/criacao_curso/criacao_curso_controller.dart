import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/curso.dart';

class CriacaoCursoController extends GetxController {
  late Projeto projeto;
  @override
  void onInit() {
    super.onInit();
    projeto = Get.arguments as Projeto;
  }

  final ScrollController scrollController = ScrollController();

  final TextEditingController nomeCurso = TextEditingController();
  final Rx<String> _nomeCursoErro = "".obs;
  final TextEditingController descricaoCurso = TextEditingController();
  final Rx<String> _descricaoCursoErro = "".obs;
  final Rx<DateTime> _inicioCurso = DateTime.now().obs;
  final Rx<DateTime> _fimCurso = DateTime.now().obs;

  final Rx<bool> _adicionandoCurso = false.obs;
  final Rx<String> _erro = "".obs;

  bool validarNomeCurso() {
    return nomeCurso.text.isNotEmpty;
  }

  onChangeNomeCurso() {
    if (!validarNomeCurso()) {
      _nomeCursoErro.value = "Nome inválido";
    } else {
      _nomeCursoErro.value = "";
    }
  }

  bool validarDescricaoCurso() {
    return descricaoCurso.text.isNotEmpty;
  }

  onChangeDescricaoCurso() {
    if (!validarDescricaoCurso()) {
      _descricaoCursoErro.value = "Descrição inválida";
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

  adicionar() async {
    if (_adicionandoCurso.value) return;
    _adicionandoCurso.value = true;

    onChangeNomeCurso();
    onChangeDescricaoCurso();
    if (nomeCursoErro == null && descricaoCursoErro == null) {
      String nome = nomeCurso.text;
      String descricao = descricaoCurso.text;

      bool? result = await adicionarCurso(
        projeto.id,
        nome,
        descricao,
        inicioCurso,
        fimCurso,
        [],
      );
      if (result != null && result) {
        _erro.value = "";
      } else {
        _erro.value = "Erro ao adicionar o curso";
      }
      if (_erro.value.isEmpty) {
        Get.back();
        return;
      }
    }

    _adicionandoCurso.value = false;
  }

  String? get nomeCursoErro =>
      _nomeCursoErro.value.isEmpty ? null : _nomeCursoErro.value;
  String? get descricaoCursoErro =>
      _descricaoCursoErro.value.isEmpty ? null : _descricaoCursoErro.value;
  bool get adicionandoCurso => _adicionandoCurso.value;
  DateTime get inicioCurso => _inicioCurso.value;
  DateTime get fimCurso => _fimCurso.value;
  String? get erro => _erro.value.isEmpty ? null : _erro.value;
}
