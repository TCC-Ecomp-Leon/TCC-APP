import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/signIn/login_controller.dart';
import 'package:tcc_app/widgets/text_field.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldImplementation(
              controller: controller.email,
              label: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => TextFieldImplementation(
                controller: controller.password,
                label: "Senha",
                textInputType: TextInputType.visiblePassword,
                useHidden: true,
                onVisibleChanged: controller.changePasswordVisibility,
                isHidden: !controller.visiblePassword,
              ),
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
            TextButton(
              onPressed: () => controller.register(),
              child: const Text("Criar conta"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
                textStyle: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
