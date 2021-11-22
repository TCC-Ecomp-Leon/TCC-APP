import 'package:flutter/material.dart';
import 'package:tcc_app/screens/login/entrar.dart';
import 'package:tcc_app/screens/login/registro.dart';
import 'package:tcc_app/widgets/page_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: PageControllerImplementation(width: 300.0, children: [
        PageControllerPage(child: Entrar(), label: "Entrar"),
        PageControllerPage(child: const Registro(), label: "Registrar"),
      ]),
    );
  }
}
