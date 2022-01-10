import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signUp/signup_view.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/models/Endereco.dart';
import 'package:tcc_app/models/Localizacao.dart';
import 'package:tcc_app/services/auth.dart';
import 'package:tcc_app/services/projeto.dart';
import '../../../utils/mock_images.dart';

typedef ValidateFunction = bool Function(String campo);

class CampoRegistro {
  TextEditingController controller = TextEditingController();
  TextInputType textInputType;
  String label;
  bool useHidden;
  bool correct;

  CampoRegistro({
    required this.textInputType,
    required this.label,
    this.useHidden = false,
    this.correct = true,
  });
}

class SignUpController extends GetxController {
  final Rx<bool> _lendoQrCode = false.obs;
  final Rx<bool> _loading = false.obs;
  final Rx<String> _errorMessage = "".obs;

  final Rx<TipoRegistro> _tipoRegistro = TipoRegistro.Aluno.obs;

  final Rx<Localizacao> _localizacaoProjeto = const Localizacao(0, 0).obs;
  final Rx<String> _imagemProjeto = imgProjeto.obs;

  final List<CampoRegistro> _camposGerais = [
    CampoRegistro(
      label: "Nome",
      textInputType: TextInputType.name,
    ),
    CampoRegistro(
      label: "Telefone",
      textInputType: TextInputType.phone,
    ),
    CampoRegistro(
      label: "Email",
      textInputType: TextInputType.emailAddress,
    ),
  ];
  final List<CampoRegistro> _camposUsuario = [
    CampoRegistro(
      label: "Senha",
      textInputType: TextInputType.visiblePassword,
      useHidden: true,
    ),
    CampoRegistro(
      label: "CPF",
      textInputType: TextInputType.text,
    ),
  ];
  final List<CampoRegistro> _camposAluno = [
    CampoRegistro(
      label: "Código de entrada",
      textInputType: TextInputType.text,
    ),
  ];
  final List<CampoRegistro> _camposProjeto = [
    CampoRegistro(label: "Descrição", textInputType: TextInputType.text),
    CampoRegistro(label: "CEP", textInputType: TextInputType.text),
    CampoRegistro(label: "Rua", textInputType: TextInputType.text),
    CampoRegistro(label: "Número", textInputType: TextInputType.number),
    CampoRegistro(label: "Complemento", textInputType: TextInputType.text),
    CampoRegistro(label: "Bairro", textInputType: TextInputType.text),
    CampoRegistro(label: "Cidade", textInputType: TextInputType.text),
    CampoRegistro(label: "Estado", textInputType: TextInputType.text),
  ];

  bool validate() {
    bool valid = true;
    for (int i = 0; i < campos.length; i++) {
      final campo = campos[i];
      final validadeCampo = campo.correct;
      ValidateFunction validateFunction;
      if (campo.textInputType == TextInputType.emailAddress) {
        validateFunction = GetUtils.isEmail;
      } else if (campo.textInputType == TextInputType.phone) {
        validateFunction = GetUtils.isPhoneNumber;
      } else if (campo.textInputType == TextInputType.number) {
        validateFunction = GetUtils.isNumericOnly;
      } else {
        validateFunction = (String campo) {
          return true;
        };
      }

      if (!validateFunction(campo.controller.text)) {
        campo.correct = false;
        valid = false;
      } else if (!campo.correct) {
        campo.correct = true;
      }
    }
    return valid;
  }

  void alterarTipoRegistro(TipoRegistro tipo) {
    _tipoRegistro.value = tipo;
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
  List<CampoRegistro> get campos => tipoRegistro == TipoRegistro.Projeto
      ? [..._camposGerais, ..._camposProjeto]
      : tipoRegistro == TipoRegistro.Aluno
          ? [..._camposGerais, ..._camposAluno]
          : _camposGerais;
}

int? entradaTextoComCaracteresParaNumero(String entrada) {
  String processado =
      entrada.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
  return int.tryParse(processado);
}
