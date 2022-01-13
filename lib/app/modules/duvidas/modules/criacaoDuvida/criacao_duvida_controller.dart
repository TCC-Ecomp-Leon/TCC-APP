import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/models/CursoUniversitario.dart';
import 'package:tcc_app/models/Materia.dart';
import 'package:tcc_app/services/duvida.dart';

class CriacaoDuvidaController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (collectionsController.cursosUniversitarios.isEmpty) {
      collectionsController.carregarCursosUniversitarios();
    }
  }

  final collectionsController = Get.find<CollectionsController>();
  final loginController = Get.find<LoginController>();

  final ScrollController scrollController = ScrollController();

  final TextEditingController titulo = TextEditingController();
  final TextEditingController descricao = TextEditingController();
  final TextEditingController mensagemInicial = TextEditingController();

  final Rx<int> _indiceCursoSelecionado = (-1).obs;
  final Rx<int> _indiceMateriaSelecionada = (-1).obs;
  final Rx<int> _indiceCursoUniversitarioSelecionado = (-1).obs;

  final Rx<String> _erroCampos = "".obs;

  final Rx<bool> _criandoDuvida = false.obs;

  selecionarCurso(int index) {
    _indiceCursoSelecionado.value = index;
    _indiceMateriaSelecionada.value = -1;
  }

  selecionarMateria(int index) {
    _indiceMateriaSelecionada.value = index;
  }

  selecionarCursoUniversitario(int index) {
    _indiceCursoUniversitarioSelecionado.value = index;
  }

  onFocusMensagemInicial() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent -
          scrollController.position.pixels,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  validar() {
    if (titulo.text.isEmpty) {
      _erroCampos.value = "Título não pode ser vazio";
      return;
    }
    if (descricao.text.isEmpty) {
      _erroCampos.value = "Descrição não pode ser vazia";
      return;
    }
    if (_indiceCursoSelecionado.value == -1) {
      _erroCampos.value = "Precisa selecionar um curso";
      return;
    }
    if (mensagemInicial.text.isEmpty) {
      _erroCampos.value = "Necessário colocar uma mensagem inicial";
      return;
    }
    _erroCampos.value = "";
  }

  criacaoDuvida() async {
    if (_criandoDuvida.value) {
      return;
    }
    _criandoDuvida.value = true;

    validar();
    if (_erroCampos.value.isEmpty) {
      bool? result = await criarDuvida(
        titulo.text,
        descricao.text,
        cursosAluno[indiceCursoSelecionado].id,
        _indiceMateriaSelecionada.value != -1
            ? materiasCursoSelecionado![_indiceCursoSelecionado.value].id
            : null,
        mensagemInicial.text,
        _indiceCursoUniversitarioSelecionado.value != -1
            ? cursosUniversitarios[_indiceCursoUniversitarioSelecionado.value]
                .id
            : null,
      );
      if (result != null && result) {
        Get.back();
      } else {
        _erroCampos.value = "Erro ao inserir a dúvida";
      }
    }

    _criandoDuvida.value = false;
  }

  List<Materia>? _materiasCursoSelecionado() {
    int? cursoSelecionado = indiceCursoSelecionado;
    if (cursoSelecionado == null || indiceCursoSelecionado == -1) return null;

    return cursosAluno[cursoSelecionado].materias;
  }

  List<Curso> _cursosAluno() {
    List<Curso>? cursos = collectionsController.getCursosAluno;
    if (cursos == null) return [];
    return cursos;
  }

  int get indiceCursoSelecionado => _indiceCursoSelecionado.value;
  int get indiceMateriaSelecionada => _indiceMateriaSelecionada.value;
  int get indiceCursoUniversitarioSelecionado =>
      _indiceCursoUniversitarioSelecionado.value;
  List<Curso> get cursosAluno => _cursosAluno();
  List<Materia>? get materiasCursoSelecionado => _materiasCursoSelecionado();
  List<CursoUniversitario> get cursosUniversitarios =>
      collectionsController.cursosUniversitarios;

  bool get criandoDuvida => _criandoDuvida.value;
  String? get erroCampos =>
      _erroCampos.value.isEmpty ? null : _erroCampos.value;
}
