import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/services/auth.dart';
import 'package:async/async.dart';

enum AuthStatus {
  Authenticated,
  NotAuthenticated,
}

class AuthInfo {
  String? authToken;
  Perfil? perfil;
  Projeto? projeto;

  AuthInfo({
    required this.authToken,
    required this.perfil,
    required this.projeto,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['authToken'] = authToken;
    json['perfil'] = perfil == null ? perfil : perfil!.toJson();
    json['projeto'] = projeto == null ? projeto : projeto!.toJson();
    return json;
  }

  AuthInfo.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    perfil = json['perfil'] != null ? Perfil.fromJson(json['perfil']) : null;
    projeto =
        json['projeto'] != null ? Projeto.fromJson(json['projeto']) : null;
  }

  AuthStatus get authStatus => (perfil == null || authToken == null)
      ? AuthStatus.NotAuthenticated
      : AuthStatus.Authenticated;
}

class LoginController extends GetxController {
  final Rx<AuthInfo> _authInfo = AuthInfo(
    authToken: null,
    perfil: null,
    projeto: null,
  ).obs;

  @override
  void onInit() {
    Map<String, dynamic>? read = box.read(Constants.authBoxKey);
    if (read != null) {
      _authInfo.value = AuthInfo.fromJson(read);
    }

    super.onInit();
  }

  Future<void> usarTokenEmCache(int msTimeout) async {
    DateTime fimLimite = DateTime.now().add(Duration(milliseconds: msTimeout));

    AuthInfo? informacoesObtidas;
    Future<AuthInfo?> obterPerfil = reobterPerfil();
    CancelableOperation cancelableOperation = CancelableOperation.fromFuture(
      obterPerfil,
      onCancel: () => {
        // ignore: avoid_print
        print('falha ao obter o perfil usando token em cache')
      },
    );

    cancelableOperation.value.then(
      (value) {
        informacoesObtidas = value as AuthInfo;
      },
    );

    // ignore: prefer_function_declarations_over_variables
    Function definirTempoTimer = (DateTime fim) {
      final int msTempoRestante = fim.difference(DateTime.now()).inMilliseconds;
      if (msTempoRestante > 1) {
        return 1;
      } else {
        return msTempoRestante;
      }
    };

    while (true) {
      final int tempoRestante = definirTempoTimer(fimLimite);

      if (tempoRestante < 0) {
        break;
      }

      await Future.delayed(Duration(milliseconds: tempoRestante));

      if (informacoesObtidas != null) {
        break;
      }
    }

    if (informacoesObtidas != null) {
      _authInfo.value = informacoesObtidas!;
      // ignore: avoid_print
      print("reobitidos ");
      // ignore: avoid_print
      print(informacoesObtidas!.perfil);
      // ignore: avoid_print
      print(informacoesObtidas!.projeto);
      avaliarEntrada(informacoesObtidas!);
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Rx<bool> _validEmail = true.obs;
  final Rx<bool> _validPassword = true.obs;

  final box = GetStorage(Constants.storageBox);

  final Rx<bool> _visiblePassword = false.obs;
  final Rx<bool> _loading = false.obs;

  final Rx<String> _loginError = "".obs;

  bool validate() {
    bool valid = true;
    if (!GetUtils.isEmail(email.text)) {
      _validEmail.value = false;
      valid = false;
    } else if (!_validEmail.value) {
      _validEmail.value = true;
    }
    if (password.text.length < 6) {
      _validPassword.value = false;
      valid = false;
    } else if (!_validPassword.value) {
      _validPassword.value = true;
    }

    return valid;
  }

  Future<void> login() async {
    if (validate()) {
      _loading.value = true;

      AuthInfo? loginResult = await signIn(email.text, password.text);

      if (loginResult == null) {
        _authInfo.value = AuthInfo(
          authToken: null,
          perfil: null,
          projeto: null,
        );
        _loginError.value = "Email ou senha errados";
      } else {
        _authInfo.value = AuthInfo(
          authToken: loginResult.authToken,
          perfil: loginResult.perfil,
          projeto: loginResult.projeto,
        );

        _loginError.value = "";
      }

      _loading.value = false;
      avaliarEntrada(_authInfo.value);
    }
  }

  changePasswordVisibility() {
    _visiblePassword.value = !_visiblePassword.value;
  }

  avaliarEntrada(AuthInfo authInfo) async {
    if (authInfo.authStatus == AuthStatus.Authenticated) {
      box.write(Constants.authBoxKey, _authInfo.toJson());
      Get.offAllNamed(afterLoginRoute(box));
    } else {
      clearBottomMenuInfo(box);
    }
  }

  signOut() {
    Get.offAllNamed(Routes.login);
    _authInfo.value = AuthInfo(
      authToken: null,
      perfil: _authInfo.value.perfil,
      projeto: _authInfo.value.projeto,
    );
    clearBottomMenuInfo(box);
  }

  register() {
    Get.toNamed(Routes.signUp);
  }

  bool get visiblePassword => _visiblePassword.value;
  bool get loading => _loading.value;
  bool get validEmail => _validEmail.value;
  bool get validPassword => _validPassword.value;
  String get loginError => _loginError.value;

  AuthInfo get authInfo => _authInfo.value;
  Perfil get perfil => _authInfo.value.perfil!;

  void set authToken(String? authToken) {
    _authInfo.value.authToken = authToken;
  }

  void set perfil(Perfil? perfil) {
    _authInfo.value.perfil = perfil;
    _authInfo.refresh();
  }

  void set projeto(Projeto? projeto) {
    _authInfo.value.projeto = projeto;
    _authInfo.refresh();
  }
}

String afterLoginRoute(GetStorage box) {
  BottomMenuInfo? read = readBottomMenuInfo(box);
  if (read != null && read.routeName != null) {
    return read.routeName!;
  }
  return Routes.perfil;
}
