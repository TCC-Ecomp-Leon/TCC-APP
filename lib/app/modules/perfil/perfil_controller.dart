import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/services/perfil.dart';
import 'package:tcc_app/utils/conversions.dart';

class PerfilController extends BottomMenuController {
  late Rx<Perfil> _perfilEdicao;
  final Rx<bool> _loadingImagemPerfil = false.obs;
  final Rx<bool> _modoEdicao = false.obs;
  final Rx<bool> _salvandoEdicao = false.obs;
  final Rx<String> _falhaEdicao = "".obs;

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
    super.onInit();
  }

  inicializarCamposEdicaoPerfil() {
    final perfil = _perfilEdicao.value;
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

  setPerfilLogin(Perfil perfil) {
    loginController.perfil = perfil;
  }

  entrarModoEdicao() {
    _nomeUsuario.value = TextEditingController(text: perfil.nome);
    _telefoneUsuario.value =
        TextEditingController(text: perfil.telefone.toString());
    _cpfUsuario.value = TextEditingController(text: perfil.cpf);

    _modoEdicao.value = true;
  }

  cancelarEdicao() {
    inicializarCamposEdicaoPerfil();
    _modoEdicao.value = false;
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

  salvarEdicao() async {
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
        loginController.perfil = setPerfilLogin(perfil);
        _perfilEdicao.value = perfil;

        _modoEdicao.value = false;
      } else {
        _falhaEdicao.value = "Erro ao salvar as informações do perfil";
      }

      _salvandoEdicao.value = false;
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
}
