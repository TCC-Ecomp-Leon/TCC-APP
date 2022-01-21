import 'package:flutter/material.dart';
import 'package:tcc_app/screens/menu_interno.dart';
import 'package:tcc_app/widgets/labeled_switch.dart';
import 'package:tcc_app/widgets/text_field.dart';
import 'package:tcc_app/utils/iterable.dart';

class CampoRegistro {
  TextEditingController controller = TextEditingController();
  TextInputType textInputType;
  String label;
  bool useHidden;

  CampoRegistro(
      {required this.textInputType,
      required this.label,
      this.useHidden = false});
}

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool projeto = false;

  List<CampoRegistro> campos = [
    CampoRegistro(label: "Nome", textInputType: TextInputType.name),
    CampoRegistro(label: "Telefone", textInputType: TextInputType.phone),
  ];

  List<CampoRegistro> camposUsuario = [
    CampoRegistro(
        label: "Código de entrada", textInputType: TextInputType.text),
    CampoRegistro(label: "Email", textInputType: TextInputType.emailAddress),
    CampoRegistro(
        label: "Senha",
        textInputType: TextInputType.visiblePassword,
        useHidden: true),
  ];

  List<CampoRegistro> camposProjeto = [
    CampoRegistro(label: "Descrição", textInputType: TextInputType.text),
    CampoRegistro(label: "CEP", textInputType: TextInputType.text),
    CampoRegistro(label: "Rua", textInputType: TextInputType.text),
    CampoRegistro(label: "Número", textInputType: TextInputType.text),
    CampoRegistro(label: "Complemento", textInputType: TextInputType.text),
    CampoRegistro(label: "Bairro", textInputType: TextInputType.text),
    CampoRegistro(label: "Cidade", textInputType: TextInputType.text),
    CampoRegistro(label: "Estado", textInputType: TextInputType.text),
  ];

  registrar(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
  }

  @override
  Widget build(BuildContext context) {
    List<CampoRegistro> camposCondicionais =
        projeto ? camposProjeto : camposUsuario;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...campos
                  .mapIndexed(
                    (e, i) => Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextFieldImplementation(
                        controller: e.controller,
                        label: e.label,
                        useHidden: e.useHidden,
                        textInputType: e.textInputType,
                      ),
                    ),
                  )
                  .toList(),
              LabeledSwitch(
                  labels: const ["Usuário", "Projeto"],
                  index: projeto ? 1 : 0,
                  switchFunction: (index) {
                    setState(() {
                      projeto = index == 1;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              ...camposCondicionais
                  .mapIndexed(
                    (e, i) => Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextFieldImplementation(
                        controller: e.controller,
                        label: e.label,
                        useHidden: e.useHidden,
                        textInputType: e.textInputType,
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () => registrar(context),
                child: const Text("Registrar"),
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
      ),
    );
  }
}
