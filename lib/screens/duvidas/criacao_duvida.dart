import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tcc_app/widgets/dropdown.dart';

class PaginaCriacaoDuvida extends StatefulWidget {
  final List<String> cursos;
  int? cursoSelecionado;
  final List<String> materias;
  int? materiaSelecionada;
  final List<String> cursosUniversitarios;
  int? cursoUniversitarioSelecionado;

  PaginaCriacaoDuvida({
    required this.cursos,
    required this.cursoSelecionado,
    required this.materias,
    required this.materiaSelecionada,
    required this.cursosUniversitarios,
    required this.cursoUniversitarioSelecionado,
    Key? key,
  }) : super(key: key);

  @override
  State<PaginaCriacaoDuvida> createState() => _PaginaCriacaoDuvidaState();
}

class _PaginaCriacaoDuvidaState extends State<PaginaCriacaoDuvida> {
  final TextEditingController titulo = TextEditingController();

  final TextEditingController descricao = TextEditingController();

  TextEditingController mensagemInicial = TextEditingController();

  Widget buildTextField(
      TextEditingController textEditingController, String hintText,
      {int maxLines = 1}) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
        child: Column(
          children: [
            Text(hintText),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: hintText,
                                border: InputBorder.none,
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(color: Colors.black),
                              maxLines: maxLines,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildDropDown(
    BuildContext context,
    String text,
    List<String> items,
    int selectedIndex,
    OnChangeDropDown onChange,
  ) {
    double width = MediaQuery.of(context).size.width - 50.0;

    return Column(
      children: [
        Text(text),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width * 0.5,
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: DropDown<String>(
                      selectedIndex: selectedIndex,
                      items: items,
                      onChangeDropDown: onChange,
                      getItemText: (value) => value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 134.0;
    double topBottomPaddingAlignment = 30.0 + (height - 598) / 2;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Center(
          child: KeyboardVisibilityBuilder(
            builder: (BuildContext context, bool isVisible) {
              final double bottomInsets = isVisible ? 220 : 0.0;
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height - bottomInsets,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildTextField(titulo, "Título"),
                          buildTextField(descricao, "Descrição"),
                          buildDropDown(context, "Curso", widget.cursos,
                              widget.cursoSelecionado ?? -1, (index) {
                            setState(() {
                              widget.cursoSelecionado = index;
                            });
                          }),
                          buildDropDown(context, "Matéria", widget.materias,
                              widget.materiaSelecionada ?? -1, (index) {
                            setState(() {
                              widget.materiaSelecionada = index;
                            });
                          }),
                          buildDropDown(
                              context,
                              "Curso Universitário",
                              widget.cursosUniversitarios,
                              widget.cursoUniversitarioSelecionado ?? -1,
                              (index) {
                            setState(() {
                              widget.cursoUniversitarioSelecionado = index;
                            });
                          }),
                          buildTextField(
                            mensagemInicial,
                            "Mensagem inicial",
                            maxLines: 5,
                          ),
                          SizedBox(
                            height:
                                !isVisible ? topBottomPaddingAlignment : 0.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: bottomInsets,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Criar dúvida"),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: Colors.white,
          backgroundColor: Colors.teal,
          onSurface: Colors.grey,
          textStyle: const TextStyle(fontSize: 17.0),
        ),
      ),
    );
  }
}
