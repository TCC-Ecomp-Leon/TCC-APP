import 'package:flutter/material.dart';
import 'package:tcc_app/screens/administracao/projetos.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/widgets/page_controller.dart';

class Administracao extends StatelessWidget {
  const Administracao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: PageControllerImplementation(
        width: MediaQuery.of(context).size.width,
        children: [
          PageControllerPage(child: const Projetos(), label: "Projetos"),
          PageControllerPage(child: const Dummy(), label: "Requisições"),
          PageControllerPage(child: const Dummy(), label: "Usuários"),
        ],
      ),
    );
  }
}
