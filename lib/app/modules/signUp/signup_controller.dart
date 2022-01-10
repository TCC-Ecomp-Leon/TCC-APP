import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signUp/signup_view.dart';
import 'package:tcc_app/models/Endereco.dart';
import 'package:tcc_app/models/Localizacao.dart';
import 'package:tcc_app/services/auth.dart';
import 'package:tcc_app/services/projeto.dart';
import '../../../utils/mock_images.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

const tipoRegistroInicial = TipoRegistro.Aluno;

typedef ValidateFunction = bool Function(String campo);
typedef OnVisibleChanged = void Function();

class CampoRegistro {
  TextEditingController controller = TextEditingController();
  TextInputType textInputType;
  String label;
  bool useHidden;
  bool visible;
  OnVisibleChanged? onVisibleChanged;
  String? errorMessage;
  ValidateFunction validateFunction;

  CampoRegistro({
    required this.textInputType,
    required this.label,
    required this.validateFunction,
    this.useHidden = false,
    this.errorMessage,
    this.visible = true,
    this.onVisibleChanged,
  });
}

class SignUpController extends GetxController {
  final Rx<bool> _lendoQrCode = false.obs;
  final Rx<bool> _loading = false.obs;
  final Rx<String> _errorMessage = "".obs;

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
        label: "Código de entrada",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
    ];
    _camposProjeto = [
      CampoRegistro(
        label: "Descrição",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "CEP",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Rua",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Número",
        textInputType: TextInputType.number,
        validateFunction: (String input) => input.isNotEmpty,
      ),
      CampoRegistro(
        label: "Complemento",
        textInputType: TextInputType.text,
        validateFunction: (String input) => input.isNotEmpty,
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
  final Rx<String> _imagemProjeto = imgProjeto.obs;

  List<CampoRegistro> _camposGerais = [];
  List<CampoRegistro> _camposUsuario = [];
  List<CampoRegistro> _camposAluno = [];
  List<CampoRegistro> _camposProjeto = [];

  bool validateItem(int index) {
    bool valid = true;
    final campo = _campos.value[index] as CampoRegistro;
    final validadeCampo = campo.errorMessage == null;

    String entrada = campo.controller.text;
    ValidateFunction validateFunction = campo.validateFunction;

    if (!validateFunction(entrada)) {
      String label = campo.label;
      campo.errorMessage = label.toLowerCase() + ' inválid';
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
    for (int i = 0; i < _campos.value.length; i++) {
      if (!validateItem(i)) {
        valid = false;
      }
    }
    return valid;
  }

  void alterarTipoRegistro(TipoRegistro tipo) {
    _tipoRegistro.value = tipo;
    _campos.value = getCampos(tipo);
  }

  List<CampoRegistro> getCampos(TipoRegistro tipo) {
    return tipo == TipoRegistro.Projeto
        ? [..._camposGerais, ..._camposProjeto]
        : tipo == TipoRegistro.Aluno
            ? [..._camposGerais, ..._camposUsuario, ..._camposAluno]
            : [..._camposGerais, ..._camposUsuario];
  }

  onVisibleChanged(String label) {
    final campos = _campos.value as List<CampoRegistro>;
    CampoRegistro find = campos.firstWhere((element) => element.label == label);
    find.visible = !find.visible;
    _campos.refresh();
  }

  Future<void> registrar() async {
    if (validate()) {
      _loading.value = true;

      String nome = _camposGerais[0].controller.text;
      int telefone = entradaTextoComCaracteresParaNumero(
          _camposGerais[1].controller.text)!;
      String email = _camposGerais[2].controller.text;

      bool? result;

      if (tipoRegistro == TipoRegistro.Projeto) {
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
        if (tipoRegistro == TipoRegistro.Aluno) {
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
        if (tipoRegistro == TipoRegistro.Aluno) {
          _errorMessage.value =
              "Erro ao registrar seu perfil como aluno. Entre em contato com o seu projeto.";
        }
        if (tipoRegistro == TipoRegistro.Projeto) {
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
  List<CampoRegistro> get campos => _campos.value as List<CampoRegistro>;
}

int? entradaTextoComCaracteresParaNumero(String entrada) {
  String processado =
      entrada.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
  return int.tryParse(processado);
}
