import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/services/auth.dart';

enum AuthStatus {
  Authenticated,
  NotAuthenticated,
}

class AuthInfo {
  String? authToken;
  Perfil? perfil;

  AuthInfo({
    required this.authToken,
    required this.perfil,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['authToken'] = authToken;
    json['perfil'] = perfil == null ? perfil : perfil!.toJson();
    return json;
  }

  AuthInfo.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    perfil = json['perfil'] != null ? Perfil.fromJson(json['perfil']) : null;
  }

  AuthStatus get authStatus => (perfil == null || authToken == null)
      ? AuthStatus.NotAuthenticated
      : AuthStatus.Authenticated;
}

class LoginController extends GetxController {
  final Rx<AuthInfo> _authInfo = AuthInfo(authToken: null, perfil: null).obs;

  @override
  void onInit() {
    Map<String, dynamic>? read = box.read(Constants.authBoxKey);
    if (read != null) {
      _authInfo.value = AuthInfo.fromJson(read);
    }

    super.onInit();
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

      LoginResult? loginResult = await signIn(email.text, password.text);

      if (loginResult == null) {
        _authInfo.value = AuthInfo(authToken: null, perfil: null);
        _loginError.value = "Email ou senha errados";
      } else {
        _authInfo.value = AuthInfo(
          authToken: loginResult.authToken,
          perfil: loginResult.perfil,
        );

        _loginError.value = "";
      }

      box.write(Constants.authBoxKey, _authInfo.toJson());

      _loading.value = false;
      avaliarEntrada(_authInfo.value);
    }
  }

  changePasswordVisibility() {
    _visiblePassword.value = !_visiblePassword.value;
  }

  avaliarEntrada(AuthInfo authInfo) {
    if (authInfo.authStatus == AuthStatus.Authenticated) {
      Get.offAllNamed(Routes.dummy);
    }
  }

  signOut() {
    _authInfo.value = AuthInfo(authToken: null, perfil: null);
    Get.offAllNamed(Routes.login);
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
}
