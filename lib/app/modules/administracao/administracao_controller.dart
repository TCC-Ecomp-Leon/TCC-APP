import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/models/CodigoEntrada.dart';
import 'package:tcc_app/models/Curso.dart';
import 'package:tcc_app/models/Materia.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/services/codigoDeEntrada.dart';
import 'package:tcc_app/widgets/page_controller.dart';

// Controlador para fornecer os estados da página que irá mostrar
// as informações de:
// (i) Se o usuário é do tipo projeto:
//        - Projeto
//        - Cursos do projeto
//        - Códigos de entrada

enum EstadoAdicaoCodigoDeEntrada {
  EntradaUsuario,
  Carregando,
  Adicionado,
}

class AdministracaoController extends BottomMenuController {
  @override
  void onInit() {
    super.onInit();
    carregarCodigosDeEntrada();
  }

  final Rx<bool> _carregandoCodigosDeEntrada = false.obs;
  final RxList<dynamic> _codigosDeEntrada = [].obs;

  final Rx<EstadoAdicaoCodigoDeEntrada> _estadoAdicaoCodigo =
      EstadoAdicaoCodigoDeEntrada.EntradaUsuario.obs;
  final Rx<bool> _codigoParaProfessor = false.obs;
  final Rx<int> _indiceCursoSelecionado = (-1).obs;
  final Rx<int> _indiceMateriaSeleciona = (-1).obs;
  final Rx<String> _codigoGerado = "".obs;
  final Rx<String> _erroAdicaoCodigoDeEntrada = "".obs;

  carregarCodigosDeEntrada() async {
    _carregandoCodigosDeEntrada.value = true;

    List<CodigoEntrada>? result = await obterCodigosDeEntrada();
    if (result != null) {
      _codigosDeEntrada.value = result;
    }

    _carregandoCodigosDeEntrada.value = false;
  }

  List<Materia> _materiasCursoSelecionado() {
    int cursoSelecionado = _indiceCursoSelecionado.value;
    if (indiceCursoSelecionado == -1) return [];

    return cursos[cursoSelecionado].materias;
  }

  alterarCodigoParaProfessor() {
    _codigoParaProfessor.value = !_codigoParaProfessor.value;
  }

  entrarEmModoDeAdicaoCodigo() {
    _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.EntradaUsuario;
    _codigoGerado.value = "";
  }

  sairModoAdicaoCodigo() {
    Get.back();
    carregarCodigosDeEntrada();
  }

  adicionarCodigo() async {
    if (_indiceCursoSelecionado.value == -1 ||
        (_indiceMateriaSeleciona.value == -1 && _codigoParaProfessor.value)) {
      return;
    }

    _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.Carregando;

    CodigoEntrada? result = await registrarCodigoDeEntrada(
      _codigoParaProfessor.value
          ? TipoCodigoDeEntrada.Professor
          : TipoCodigoDeEntrada.Aluno,
      cursos[_indiceCursoSelecionado.value].id,
      _codigoParaProfessor.value
          ? materiasCurso[_indiceCursoSelecionado.value].id
          : null,
    );
    if (result != null) {
      _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.Adicionado;
      _codigoGerado.value = result.id;
    } else {
      _estadoAdicaoCodigo.value = EstadoAdicaoCodigoDeEntrada.EntradaUsuario;
      _erroAdicaoCodigoDeEntrada.value =
          "Erro ao adicionar o código de entrada";
    }
  }

  abrirMateria() {}

  abrirCodigo() {}

  Projeto get projeto => loginController.authInfo.projeto!;
  List<Curso> get cursos => loginController.authInfo.projeto!.cursos;
  List<Materia> get materiasCurso => _materiasCursoSelecionado();
  List<CodigoEntrada> get codigosDeEntrada =>
      _codigosDeEntrada.value as List<CodigoEntrada>;
  bool get carregandoCodigosDeEntrada => _carregandoCodigosDeEntrada.value;

  bool get codigoParaProfessor => _codigoParaProfessor.value;
  int get indiceCursoSelecionado => _indiceCursoSelecionado.value;
  int get indiceMateriaSelecionada => _indiceMateriaSeleciona.value;

  selecionarCurso(int index) {
    _indiceCursoSelecionado.value = index;
    _indiceMateriaSeleciona.value = -1;
  }

  selecionarMateria(int index) {
    _indiceMateriaSeleciona.value = index;
  }

  String? get codigoGerado =>
      _codigoGerado.value.isEmpty ? null : _codigoGerado.value;
  EstadoAdicaoCodigoDeEntrada get estadoAdicaoCodigo =>
      _estadoAdicaoCodigo.value;
  String? get erroAdicaoCodigoDeEntrada =>
      _erroAdicaoCodigoDeEntrada.value.isEmpty
          ? null
          : _erroAdicaoCodigoDeEntrada.value;
}