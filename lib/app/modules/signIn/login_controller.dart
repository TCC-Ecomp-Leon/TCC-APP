import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tcc_app/app/routes/app_routes.dart';
import 'package:tcc_app/config/constants.dart';
import 'package:tcc_app/screens/perfil.dart';
import 'package:tcc_app/services/auth.dart';

class LoginController extends GetxController {
  Rx<String?> authToken = null.obs;
  Rx<Perfil?> loggedUser = null.obs;

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
        loggedUser.value = null;
        authToken.value = null;
        _loginError.value = "Email ou senha errados";
      } else {
        loggedUser.value = loginResult.perfil as Perfil;
        authToken.value = loginResult.authToken;

        _loginError.value = "";
      }

      _loading.value = false;
      avaliarEntrada();
    }
  }

  changePasswordVisibility() {
    _visiblePassword.value = !_visiblePassword.value;
  }

  avaliarEntrada() {
    if (loggedUser.value != null) {
      // Get.offAllNamed(newRouteName);
    }
  }

  signOut() {
    loggedUser.value = null;
    authToken.value = null;
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
}
