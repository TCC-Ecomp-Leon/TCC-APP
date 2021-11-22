import 'package:flutter/material.dart';
import 'package:tcc_app/screens/menu_interno.dart';
import 'package:tcc_app/widgets/text_field.dart';

class Entrar extends StatelessWidget {
  Entrar({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  entrar(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
  }

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
              controller: email,
              label: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldImplementation(
              controller: senha,
              label: "Senha",
              textInputType: TextInputType.visiblePassword,
              useHidden: true,
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextButton(
              onPressed: () => entrar(context),
              child: const Text("Entrar"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
                textStyle: const TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
