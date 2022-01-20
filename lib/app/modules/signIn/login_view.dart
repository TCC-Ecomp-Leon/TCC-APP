import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/text_field.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        alignment: Alignment.center,
        child: Obx(
          () => controller.loading
              ? Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  child: const Loading(
                    color: Colors.white,
                    circleTimeSeconds: 2,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldImplementation(
                      controller: controller.email,
                      label: "Email",
                      textInputType: TextInputType.emailAddress,
                      errorMessage:
                          controller.validEmail ? null : "Email inválido",
                      onChange: () {
                        controller.validate();
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFieldImplementation(
                      controller: controller.password,
                      label: "Senha",
                      textInputType: TextInputType.visiblePassword,
                      useHidden: true,
                      onVisibleChanged: controller.changePasswordVisibility,
                      isHidden: !controller.visiblePassword,
                      errorMessage:
                          controller.validPassword ? null : "Senha inválida",
                      onChange: () {
                        controller.validate();
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      controller.loginError,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextButton(
                      onPressed: () => controller.login(),
                      child: const Text("Entrar"),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        textStyle: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () => controller.register(),
                      child: const Text("Criar conta"),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(7.0),
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        textStyle: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
