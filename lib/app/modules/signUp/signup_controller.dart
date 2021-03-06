import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_cep/search_cep.dart';
import 'package:tcc_app/app/modules/signUp/signup_view.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/auth.dart';
import 'package:tcc_app/services/pesquisaCep.dart';
import 'package:tcc_app/services/projeto.dart';
import 'package:tcc_app/utils/conversions.dart';
import '../../../utils/mock_images.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

const tipoRegistroInicial = TipoRegistro.aluno;

typedef ValidateFunction = bool Function(String campo);
typedef OnVisibleChanged = void Function();

class CampoRegistro {
  late TextEditingController controller;
  TextInputType textInputType;
  String label;
  bool useHidden;
  bool visible;
  OnVisibleChanged? onVisibleChanged;
  String? errorMessage;
  ValidateFunction validateFunction;
  bool cameraOption;

  CampoRegistro({
    required this.textInputType,
    required this.label,
    required this.validateFunction,
    this.useHidden = false,
    this.errorMessage,
    this.visible = true,
    this.onVisibleChanged,
    this.cameraOption = false,
    TextEditingController? controller,
  }) {
    if (controller != null) {
      this.controller = controller;
    } else {
      this.controller = TextEditingController();
    }
  }
}

class SignUpController extends GetxController {
  final Rx<bool> _lendoQrCode = false.obs;
  final Rx<bool> _loading = false.obs;
  final Rx<String> _errorMessage = "".obs;
  final Rx<String> _imagemProjeto = imgProjeto.obs;

  @override
  void onInit() {
    super.onInit();
    _camposGerais = [
      CampoRegistro(
        label: "Nome",
        textInputType: TextInputType.name,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Telefone",
        textInputType: TextInputType.phone,
        validateFunction: GetUtils.isPhoneNumber,
      ),
      CampoRegistro(
        label: "Email",
        textInputType: TextInputType.emailAddress,
        validateFunction: GetUtils.isEmail,
      ),
    ];
    _camposUsuario = [
      CampoRegistro(
        label: "Senha",
        textInputType: TextInputType.visiblePassword,
        useHidden: true,
        visible: false,
        validateFunction: (String input) => input.length > 6,
        onVisibleChanged: () {
          onVisibleChanged("Senha");
        },
      ),
      CampoRegistro(
        label: "CPF",
        textInputType: TextInputType.text,
        validateFunction: CPFValidator.isValid,
      ),
    ];
    _camposAluno = [
      CampoRegistro(
        label: "C??digo de entrada",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
        cameraOption: true,
      ),
    ];
    _camposProjeto = [
      CampoRegistro(
        label: "Descri????o",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "CEP",
        textInputType: TextInputType.text,
        validateFunction: (String input) {
          _searchCep(input);
          return input.isNotEmpty;
        },
      ),
      CampoRegistro(
        label: "Rua",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "N??mero",
        textInputType: TextInputType.number,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Complemento",
        textInputType: TextInputType.text,
        validateFunction: (String input) => true,
      ),
      CampoRegistro(
        label: "Bairro",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Cidade",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Estado",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
    ];

    _campos.value = getCampos(tipoRegistroInicial);
  }

  final Rx<TipoRegistro> _tipoRegistro = tipoRegistroInicial.obs;

  final RxList<dynamic> _campos = [].obs;

  final Rx<Localizacao> _localizacaoProjeto = const Localizacao(0, 0).obs;

  List<CampoRegistro> _camposGerais = [];
  List<CampoRegistro> _camposUsuario = [];
  List<CampoRegistro> _camposAluno = [];
  List<CampoRegistro> _camposProjeto = [];

  bool validateItem(int index) {
    bool valid = true;
    // ignore: invalid_use_of_protected_member
    final campo = _campos.value[index] as CampoRegistro;

    String entrada = campo.controller.text;
    ValidateFunction validateFunction = campo.validateFunction;

    if (!validateFunction(entrada)) {
      String label = campo.label;
      campo.errorMessage = label.toLowerCase() + ' inv??lid';
      if (label.characters.last == "a") {
        campo.errorMessage = campo.errorMessage! + "a";
      } else {
        campo.errorMessage = campo.errorMessage! + "o";
      }
      valid = false;
    } else if (campo.errorMessage != null) {
      campo.errorMessage = null;
    }
    _campos.refresh();
    return valid;
  }

  bool validate() {
    bool valid = true;
    // ignore: invalid_use_of_protected_member
    for (int i = 0; i < _campos.value.length; i++) {
      if (!validateItem(i)) {
        valid = false;
      }
    }
    return valid;
  }

  Future<void> _searchCep(String cep) async {
    ViaCepInfo? result = await pesquisaCep(cep);
    if (result != null) {
      CampoRegistro campoRua = getElementoViaLabel("Rua");
      CampoRegistro campoBairro = getElementoViaLabel("Bairro");
      CampoRegistro campoCidade = getElementoViaLabel("Cidade");
      CampoRegistro campoEstado = getElementoViaLabel("Estado");
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
    _campos.refresh();
  }

  void alterarTipoRegistro(TipoRegistro tipo) {
    _tipoRegistro.value = tipo;
    _campos.value = getCampos(tipo);
  }

  List<CampoRegistro> getCampos(TipoRegistro tipo) {
    return tipo == TipoRegistro.projeto
        ? [..._camposGerais, ..._camposProjeto]
        : tipo == TipoRegistro.aluno
            ? [..._camposGerais, ..._camposUsuario, ..._camposAluno]
            : [..._camposGerais, ..._camposUsuario];
  }

  onVisibleChanged(String label) {
    CampoRegistro find = getElementoViaLabel(label);
    find.visible = !find.visible;
    _campos.refresh();
  }

  CampoRegistro getElementoViaLabel(String label) {
    // ignore: invalid_use_of_protected_member
    final campos = _campos.value.map((e) => e as CampoRegistro).toList();
    CampoRegistro find = campos.firstWhere(
        (element) => element.label.toLowerCase() == label.toLowerCase());
    return find;
  }

  void alterarImagemProjeto(String novaImagem) {
    _imagemProjeto.value = novaImagem;
  }

  Future<void> registrar() async {
    if (validate()) {
      _loading.value = true;

      String nome = _camposGerais[0].controller.text;
      int telefone = entradaTextoComCaracteresParaNumero(
          _camposGerais[1].controller.text)!;
      String email = _camposGerais[2].controller.text;

      bool? result;

      if (tipoRegistro == TipoRegistro.projeto) {
        String descricao = _camposProjeto[0].controller.text;
        String cep = _camposProjeto[1].controller.text;
        String rua = _camposProjeto[2].controller.text;
        String numero = _camposProjeto[3].controller.text;
        String complemento = _camposProjeto[4].controller.text;
        String bairro = _camposProjeto[5].controller.text;
        String cidade = _camposProjeto[6].controller.text;
        String estado = _camposProjeto[7].controller.text;
        Endereco endereco = Endereco(
          rua,
          int.parse(numero),
          complemento,
          bairro,
          cidade,
          estado,
          entradaTextoComCaracteresParaNumero(cep)!,
          localizacaoProjeto,
        );

        result = await registrarProjeto(
          nome,
          descricao,
          email,
          telefone,
          imagemProjeto,
          endereco,
        );
      } else {
        String senha = _camposUsuario[0].controller.text;
        String cpf = _camposUsuario[1].controller.text;
        String? codigoDeEntrada;
        if (tipoRegistro == TipoRegistro.aluno) {
          codigoDeEntrada = _camposAluno[0].controller.text;
        }
        result = await signUp(
          email,
          senha,
          nome,
          telefone,
          cpf,
          codigoDeEntrada,
        );
      }

      if (result == null) {
        if (tipoRegistro == TipoRegistro.aluno) {
          _errorMessage.value =
              "Erro ao registrar seu perfil como aluno. Entre em contato com o seu projeto.";
        }
        if (tipoRegistro == TipoRegistro.projeto) {
          _errorMessage.value =
              "Erro ao registrar o projeto. Entre em contato com os administradores do sistema.";
        } else {
          _errorMessage.value =
              "Erro ao registrar seu perfil. Entre em contato com os desenvolvedores.";
        }
      } else if (result) {
        Get.back();
      }

      _loading.value = false;
    }
  }

  bool get lendoQrCode => _lendoQrCode.value;
  TipoRegistro get tipoRegistro => _tipoRegistro.value;
  bool get loading => _loading.value;
  String get imagemProjeto => _imagemProjeto.value;
  Localizacao get localizacaoProjeto => _localizacaoProjeto.value;
  List<CampoRegistro> get campos =>
      // ignore: invalid_use_of_protected_member
      _campos.value.map((e) => e as CampoRegistro).toList();
}
