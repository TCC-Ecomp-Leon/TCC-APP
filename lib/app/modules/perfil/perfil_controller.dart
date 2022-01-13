import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:search_cep/search_cep.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/app/modules/signUp/signup_controller.dart';
import 'package:tcc_app/models/CursoUniversitario.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/services/auth.dart';
import 'package:tcc_app/services/codigoDeEntrada.dart';
import 'package:tcc_app/services/perfil.dart';
import 'package:tcc_app/services/pesquisaCep.dart';
import 'package:tcc_app/services/projeto.dart';
import 'package:tcc_app/utils/conversions.dart';

enum EstadoAdicaoCodigoEntrada {
  Nenhum,
  Carregando,
  Adicionado,
  Erro,
}

class PerfilController extends BottomMenuController {
  final CollectionsController collectionsController =
      Get.find<CollectionsController>();
  late Rx<Perfil> _perfilEdicao;
  final Rx<bool> _loadingImagemPerfil = false.obs;
  final Rx<bool> _modoEdicao = false.obs;
  final Rx<bool> _salvandoEdicao = false.obs;
  final Rx<String> _falhaEdicao = "".obs;

  late Rx<Projeto?> _projetoEdicao;
  final Rx<bool> _modoEdicaoProjeto = false.obs;
  final Rx<bool> _loadingImagemProjeto = false.obs;
  final Rx<bool> _salvandoEdicaoProjeto = false.obs;
  late RxList<dynamic> _camposProjeto;

  final Rx<bool> _edicaoUniversitario = false.obs;

  final Rx<EstadoAdicaoCodigoEntrada> _estadoAdicaoCodigoEntrada =
      EstadoAdicaoCodigoEntrada.Nenhum.obs;

  Future<void> _searchCep(String cep) async {
    ViaCepInfo? result = await pesquisaCep(cep);
    if (result != null) {
      CampoRegistro campoRua = camposProjeto[4];
      CampoRegistro campoBairro = camposProjeto[5];
      CampoRegistro campoCidade = camposProjeto[6];
      CampoRegistro campoEstado = camposProjeto[7];
      if (campoRua.controller.text.isEmpty && result.logradouro != null) {
        campoRua.controller.value = TextEditingValue(text: result.logradouro!);
      }
      if (campoBairro.controller.text.isEmpty && result.bairro != null) {
        campoBairro.controller.value = TextEditingValue(text: result.bairro!);
      }
      if (campoCidade.controller.text.isEmpty && result.localidade != null) {
        campoCidade.controller.value =
            TextEditingValue(text: result.localidade!);
      }
      if (campoEstado.controller.text.isEmpty && result.uf != null) {
        campoEstado.controller.value = TextEditingValue(text: result.uf!);
      }
    }
    update();
  }

  final Rx<TextEditingController> _nomeUsuario = TextEditingController().obs;
  final Rx<String> _errorNomeUsuario = "".obs;
  final Rx<TextEditingController> _telefoneUsuario =
      TextEditingController().obs;
  final Rx<String> _erroTelefoneUsuario = "".obs;
  final Rx<TextEditingController> _cpfUsuario = TextEditingController().obs;
  final Rx<String> _erroCpfUsuario = "".obs;

  @override
  void onInit() {
    _perfilEdicao = loginController.perfil.obs;
    _projetoEdicao = loginController.authInfo.projeto.obs;
    inicializarCamposEdicaoPerfil();
    inicializarCamposEdicaoProjeto();
    super.onInit();
  }

  inicializarCamposEdicaoProjeto() {
    final Projeto? projeto = loginController.authInfo.projeto;
    if (projeto != null) {
      _camposProjeto = [
        CampoRegistro(
            label: "Nome",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.nome)),
        CampoRegistro(
            label: "Descrição",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.descricao)),
        CampoRegistro(
            label: "Teletone",
            textInputType: TextInputType.phone,
            validateFunction: GetUtils.isPhoneNumber,
            controller:
                TextEditingController(text: projeto.telefone.toString())),
        CampoRegistro(
            label: "CEP",
            textInputType: TextInputType.text,
            validateFunction: (String input) {
              _searchCep(input);
              return input.isNotEmpty;
            },
            controller:
                TextEditingController(text: projeto.endereco.cep.toString())),
        CampoRegistro(
            label: "Rua",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.endereco.rua)),
        CampoRegistro(
            label: "Número",
            textInputType: TextInputType.number,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(
                text: projeto.endereco.numero.toString())),
        CampoRegistro(
            label: "Complemento",
            textInputType: TextInputType.text,
            validateFunction: (String input) => true,
            controller:
                TextEditingController(text: projeto.endereco.complemento)),
        CampoRegistro(
            label: "Bairro",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.endereco.bairro)),
        CampoRegistro(
            label: "Cidade",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.endereco.cidade)),
        CampoRegistro(
            label: "Estado",
            textInputType: TextInputType.text,
            validateFunction: (String input) => input.isNotEmpty,
            controller: TextEditingController(text: projeto.endereco.estado)),
      ].obs;
    } else {
      _camposProjeto = [].obs;
    }
  }

  onChangeCampoProjeto(int index) {
    CampoRegistro campoRegistro = _camposProjeto.value[index];
    bool valido = campoRegistro.errorMessage == null;
    if (!campoRegistro.validateFunction(campoRegistro.controller.text)) {
      campoRegistro.errorMessage =
          campoRegistro.label.toLowerCase() + " inválido";
    } else if (!valido) {
      campoRegistro.errorMessage = null;
    }
    _camposProjeto.value[index] = campoRegistro;
    _camposProjeto.refresh();
  }

  inicializarCamposEdicaoPerfil() {
    final perfil = loginController.perfil;
    _nomeUsuario.value = TextEditingController(text: perfil.nome);
    _telefoneUsuario.value =
        TextEditingController(text: perfil.telefone.toString());
    _cpfUsuario.value = TextEditingController(text: perfil.cpf);
  }

  alterarFotoPerfil(String novaImagem) async {
    final Perfil perfil = _perfilEdicao.value;

    _loadingImagemPerfil.value = true;

    _perfilEdicao.value = _perfilEdicao.value.copyWith(fotoPerfil: novaImagem);

    String imagemAntiga = perfil.fotoPerfil;

    bool? result = await atualizarPerfil(
      perfil.id,
      null,
      null,
      novaImagem,
      null,
      null,
    );
    if (result != null && result) {
      _loadingImagemPerfil.value = false;
    } else {
      _perfilEdicao.value =
          _perfilEdicao.value.copyWith(fotoPerfil: imagemAntiga);
    }

    setPerfilLogin(_perfilEdicao.value);

    _loadingImagemPerfil.value = false;
  }

  alterarImagemProjeto(String novaImagem) async {
    if (_projetoEdicao.value != null) {
      final Projeto projeto = loginController.authInfo.projeto!;

      String imagemAntiga = projeto.imgProjeto;

      _loadingImagemProjeto.value = true;

      _projetoEdicao.value =
          _projetoEdicao.value!.copyWith(imgProjeto: novaImagem);

      bool? result = await atualizarProjeto(
        projeto.id,
        null,
        null,
        null,
        novaImagem,
        null,
      );
      if (result != null && result) {
      } else {
        _projetoEdicao.value =
            _projetoEdicao.value!.copyWith(imgProjeto: imagemAntiga);
      }

      setProjeto(_projetoEdicao.value!);

      _loadingImagemProjeto.value = false;
    }
  }

  setPerfilLogin(Perfil perfil) {
    loginController.perfil = perfil;
  }

  setProjeto(Projeto projeto) {
    loginController.projeto = projeto;
  }

  entrarModoEdicao() {
    _nomeUsuario.value = TextEditingController(text: perfil.nome);
    _telefoneUsuario.value =
        TextEditingController(text: perfil.telefone.toString());
    _cpfUsuario.value = TextEditingController(text: perfil.cpf);

    _modoEdicao.value = true;
  }

  entrarModoEdicaoProjeto() {
    _modoEdicaoProjeto.value = true;
  }

  cancelarEdicao() {
    inicializarCamposEdicaoPerfil();
    _modoEdicaoProjeto.value = false;
  }

  cancelarEdicaoProjeto() {
    inicializarCamposEdicaoProjeto();
    _modoEdicaoProjeto.value = false;
  }

  onChangeNome() {
    bool valid = _nomeUsuario.value.text.isNotEmpty;
    if (!valid) {
      _errorNomeUsuario.value = "Esse campo não pode ser vazio";
    } else if (_errorNomeUsuario.isNotEmpty) {
      _errorNomeUsuario.value = "";
    }
  }

  onChangeTelefone() {
    bool valid = GetUtils.isPhoneNumber(_telefoneUsuario.value.text);
    if (!valid) {
      _erroTelefoneUsuario.value = "Telefone inválido";
    } else if (_erroTelefoneUsuario.isNotEmpty) {
      _erroTelefoneUsuario.value = "";
    }
  }

  onChangeCpf() {
    if (cpfUsuario == null) {
      return;
    }
    bool valid = CPFValidator.isValid(_cpfUsuario.value.text);
    if (!valid) {
      _erroCpfUsuario.value = "CPF inválido";
    } else if (_erroCpfUsuario.isNotEmpty) {
      _erroCpfUsuario.value = "";
    }
  }

  salvarEdicaoPerfil() async {
    onChangeNome();
    onChangeTelefone();
    onChangeTelefone();
    if (erroNomeUsuario == null &&
        erroTelefoneUsuario == null &&
        erroCpfUsuario == null) {
      _salvandoEdicao.value = true;

      String nome = _nomeUsuario.value.text;
      int telefone =
          entradaTextoComCaracteresParaNumero(_telefoneUsuario.value.text)!;
      String? cpf =
          perfil.regra == RegraPerfil.Geral ? _cpfUsuario.value.text : null;

      bool? result = await atualizarPerfil(
        perfil.id,
        nome,
        telefone,
        null,
        cpf,
        null,
      );

      if (result != null && result) {
        Perfil perfil = _perfilEdicao.value.copyWith(
          nome: nome,
          telefone: telefone,
          cpf: cpf,
        );
        setPerfilLogin(perfil);
        _perfilEdicao.value = perfil;

        _modoEdicao.value = false;
      } else {
        _falhaEdicao.value = "Erro ao salvar as informações do perfil";
      }

      _salvandoEdicao.value = false;
    }
  }

  salvarEdicaoProjeto() async {}

  inicioInsercaoCodigoEntrada() {
    _estadoAdicaoCodigoEntrada.value = EstadoAdicaoCodigoEntrada.Nenhum;
  }

  adicionarCodigoDeEntrada(String codigo) async {
    _estadoAdicaoCodigoEntrada.value = EstadoAdicaoCodigoEntrada.Carregando;

    bool? result = await usarCodigoDeEntrada(codigo);
    if (result != null && result) {
      _estadoAdicaoCodigoEntrada.value = EstadoAdicaoCodigoEntrada.Adicionado;
    } else {
      _estadoAdicaoCodigoEntrada.value = EstadoAdicaoCodigoEntrada.Erro;
    }

    AuthInfo? perfilAtualizado = await reobterPerfil();
    if (perfilAtualizado != null) {
      loginController.authToken = perfilAtualizado.authToken;
      loginController.perfil = perfilAtualizado.perfil;
      loginController.projeto = perfilAtualizado.projeto;
    }
  }

  Perfil get getPerfilEdicao => _perfilEdicao.value;
  bool get loadingImagemPerfil => _loadingImagemPerfil.value;
  bool get modoEdicao => _modoEdicao.value;
  bool get salvandoEdicao => _salvandoEdicao.value;

  Perfil get perfil => loginController.authInfo.perfil!;

  TextEditingController get nomeUsuario => _nomeUsuario.value;
  TextEditingController get telefoneUsuario => _telefoneUsuario.value;
  TextEditingController? get cpfUsuario =>
      perfil.regra == RegraPerfil.Geral ? _cpfUsuario.value : null;

  String? get erroNomeUsuario =>
      _errorNomeUsuario.value.isNotEmpty ? _errorNomeUsuario.value : null;
  String? get erroTelefoneUsuario =>
      _erroTelefoneUsuario.value.isNotEmpty ? _erroTelefoneUsuario.value : null;
  String? get erroCpfUsuario =>
      _erroCpfUsuario.value.isNotEmpty ? _erroCpfUsuario.value : null;

  String? get falhaEdicao =>
      _falhaEdicao.value.isNotEmpty ? _falhaEdicao.value : null;

  bool get loadingImagemProjeto => _loadingImagemProjeto.value;
  bool get modoEdicaoProjeto => _modoEdicaoProjeto.value;

  Projeto? get projetoEmEdicao => _projetoEdicao.value;
  List<CampoRegistro> get camposProjeto =>
      _camposProjeto.value.map((e) => e as CampoRegistro).toList();
  bool get salvandoEdicaoProjeto => _salvandoEdicaoProjeto.value;

  bool get usuarioGeral => loginController.perfil.regra == RegraPerfil.Geral;
  EstadoAdicaoCodigoEntrada get estadoAdicaoCodigoEntrada =>
      _estadoAdicaoCodigoEntrada.value;

  final Rx<int> _indiceCursoUniversitarioSelecionado = (-1).obs;

  void selecionarCursoUniversitario(int index) {
    _indiceCursoUniversitarioSelecionado.value = index;
  }

  void entrarModoEdicaoCursoUniversitario() {
    print('aqui');
    _edicaoUniversitario.value = true;
    final cursosUniversitariosCarregagos =
        collectionsController.cursosUniversitarios;
    if (cursosUniversitariosCarregagos.isEmpty) {
      collectionsController.carregarCursosUniversitarios();
    }
  }

  void sairModoEdicaoCursoUniversitario() {
    _edicaoUniversitario.value = false;
  }

  bool get edicaoUniversitario => _edicaoUniversitario.value;
  List<CursoUniversitario> get cursosUniversitarios =>
      collectionsController.cursosUniversitarios;
  int get indiceCursoUniversitarioSelecionado =>
      _indiceCursoUniversitarioSelecionado.value;
}
