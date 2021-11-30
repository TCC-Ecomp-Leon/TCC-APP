import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tcc_app/utils/formatacoes.dart';

typedef OnDateChange = void Function(DateTime newDate);

class PaginaAdicaoCurso extends StatefulWidget {
  const PaginaAdicaoCurso({
    Key? key,
  }) : super(key: key);

  @override
  State<PaginaAdicaoCurso> createState() => _PaginaAdicaoCursoState();
}

class _PaginaAdicaoCursoState extends State<PaginaAdicaoCurso> {
  final TextEditingController nomeCurso = TextEditingController();

  final TextEditingController descricao = TextEditingController();

  DateTime inicio = DateTime.now();
  DateTime fim = DateTime.now().add(
    const Duration(days: 6 * 30),
  );

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

  pickDate(DateTime date, OnDateChange onDateChange) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      onDateChange(pickedDate);
    }
  }

  Widget buildDatePicker(
    BuildContext context,
    String text,
    DateTime dateTime,
    OnDateChange onChange,
  ) {
    double width = MediaQuery.of(context).size.width - 50.0;

    return Column(
      children: [
        Text(text),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: () {
            pickDate(dateTime, onChange);
          },
          child: Container(
            height: 70.0,
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
                      child: Text(
                        diaComAno(dateTime).replaceAll(" ", "0"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
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
                          buildTextField(nomeCurso, "Nome do curso"),
                          buildTextField(descricao, "Descrição", maxLines: 3),
                          buildDatePicker(context, "Dia de Início", inicio,
                              (newDate) {
                            setState(() {
                              inicio = newDate;
                            });
                          }),
                          buildDatePicker(context, "Dia de fim", fim,
                              (newDate) {
                            setState(() {
                              fim = newDate;
                            });
                          }),
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
        child: const Text("Criar Curso"),
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
