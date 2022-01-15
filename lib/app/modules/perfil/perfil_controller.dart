import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:search_cep/search_cep.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/modules/signUp/signup_controller.dart';
import 'package:tcc_app/models/index.dart';
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
              int? parse = int.tryParse(input);
              _searchCep(input);
              return input.isNotEmpty && parse != null;
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
            validateFunction: (String input) {
              int? parse = int.tryParse(input);
              return input.isNotEmpty && parse != null;
            },
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
    if (projeto != null) {
      final Projeto projeto = loginController.authInfo.projeto!;

      String imagemAntiga = projeto.imgProjeto;

      _loadingImagemProjeto.value = true;

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
        loginController.projeto = projeto.copyWith(imgProjeto: imagemAntiga);
      }

      _loadingImagemProjeto.value = false;

      loginController.recarregarProjeto();
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
      loginController.recarregarPerfil();
    }
  }

  bool validarCamposEdicaoProjeto() {
    for (int i = 0; i < _camposProjeto.value.length; i++) {
      onChangeCampoProjeto(i);
      final CampoRegistro campoRegistro = _camposProjeto[i] as CampoRegistro;
      if (campoRegistro.errorMessage != null) {
        return false;
      }
    }

    return true;
  }

  salvarEdicaoProjeto() async {
    if (validarCamposEdicaoProjeto()) {
      _salvandoEdicaoProjeto.value = true;
      String nome = camposProjeto[0].controller.text;
      String descricao = camposProjeto[1].controller.text;
      int telefone = int.parse(camposProjeto[2].controller.text);

      int cep = int.parse(camposProjeto[3].controller.text);
      String rua = camposProjeto[4].controller.text;
      int numero = int.parse(camposProjeto[5].controller.text);
      String complemento = camposProjeto[6].controller.text;
      String bairro = camposProjeto[7].controller.text;
      String cidade = camposProjeto[8].controller.text;
      String estado = camposProjeto[9].controller.text;

      bool? result = await atualizarProjeto(
        projeto!.id,
        nome,
        descricao,
        telefone,
        null,
        Endereco(
          rua,
          numero,
          complemento,
          bairro,
          cidade,
          estado,
          cep,
          projeto!.endereco.localizacao,
        ),
      );
      if (result != null && result) {
        loginController.projeto = projeto!.copyWith(
            nome: nome,
            descricao: descricao,
            telefone: telefone,
            endereco: Endereco(
              rua,
              numero,
              complemento,
              bairro,
              cidade,
              estado,
              cep,
              projeto!.endereco.localizacao,
            ));
      } else {
        _falhaEdicao.value = "Erro ao editar as informações do projeto";
      }

      loginController.recarregarProjeto();

      _salvandoEdicaoProjeto.value = false;
    }
  }

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

    loginController.recarregarPerfil();
  }

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

  Projeto? get projeto => loginController.authInfo.projeto;
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

  void salvarEdicaoCursoUniversitario() async {
    _edicaoUniversitario.value = false;
    await atualizarPerfil(
      perfil.id,
      null,
      null,
      null,
      null,
      indiceCursoUniversitarioSelecionado > -1
          ? cursosUniversitarios[indiceCursoUniversitarioSelecionado].id
          : null,
    );
    loginController.usarTokenEmCache(2000);
  }

  bool get edicaoUniversitario => _edicaoUniversitario.value;
  List<CursoUniversitario> get cursosUniversitarios =>
      collectionsController.cursosUniversitarios;
  int get indiceCursoUniversitarioSelecionado =>
      _indiceCursoUniversitarioSelecionado.value;
}
