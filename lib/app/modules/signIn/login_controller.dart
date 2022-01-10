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

  Rx<bool> validEmail = false.obs;
  Rx<bool> validPassword = false.obs;

  final box = GetStorage(Constants.storageBox);

  Rx<bool> _visiblePassword = false.obs;
  Rx<bool> _loading = false.obs;

  Rx<String> loginError = "".obs;

  bool validate() {
    bool valid = true;
    if (!GetUtils.isEmail(email.text)) {
      validEmail.value = false;
      valid = false;
    } else if (!validEmail.value) {
      validEmail.value = true;
    }
    if (password.text.length < 6) {
      validPassword.value = false;
      valid = false;
    } else if (!validPassword.value) {
      validPassword.value = true;
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
        loginError.value = "Email ou senha errados";
      } else {
        loggedUser.value = loginResult.perfil as Perfil;
        authToken.value = loginResult.authToken;

        loginError.value = "";
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
}
