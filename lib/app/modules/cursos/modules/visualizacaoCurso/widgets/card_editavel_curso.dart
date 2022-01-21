import 'package:flutter/material.dart';
import 'package:tcc_app/utils/formatacoes.dart';

typedef OnFocusFunction = void Function();
typedef OnChangeTextField = void Function();
typedef OnSelectDate = void Function(DateTime date);
typedef ButtonActions = void Function();

class CardEditavelCurso extends StatelessWidget {
  bool editando;
  TextEditingController nomeCurso;
  String? nomeCursoErro;
  TextEditingController descricaoCurso;
  String? descricaoCursoErro;
  DateTime inicioCurso;
  DateTime fimCurso;
  OnChangeTextField onChangeNomeCurso;
  OnChangeTextField onChangeDesricaoCurso;
  OnSelectDate onSelectDataInicial;
  OnSelectDate onSelectDataFinal;
  bool permissaoEditar;
  bool permissaoAdicionarMateria;
  ButtonActions cancelarEdicao;
  ButtonActions salvarEdicao;
  ButtonActions entrarModoEdicao;
  ButtonActions entrarModoAdicaoMateria;
  String? erro;

  CardEditavelCurso({
    required this.nomeCurso,
    required this.descricaoCurso,
    required this.inicioCurso,
    required this.fimCurso,
    required this.editando,
    required this.nomeCursoErro,
    required this.descricaoCursoErro,
    required this.onChangeNomeCurso,
    required this.onChangeDesricaoCurso,
    required this.onSelectDataInicial,
    required this.onSelectDataFinal,
    required this.permissaoEditar,
    required this.cancelarEdicao,
    required this.salvarEdicao,
    required this.entrarModoEdicao,
    required this.erro,
    required this.permissaoAdicionarMateria,
    required this.entrarModoAdicaoMateria,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextField(
                        nomeCurso,
                        "Nome",
                        erroMessage: nomeCursoErro,
                        onChangeTextField: onChangeNomeCurso,
                      ),
                      buildTextField(
                        descricaoCurso,
                        "Descrição",
                        erroMessage: descricaoCursoErro,
                        onChangeTextField: onChangeDesricaoCurso,
                        maxLines: 3,
                      ),
                      buildDateSelector(
                        context,
                        "Início do curso",
                        inicioCurso,
                        onSelectDate: (dateTime) {
                          onSelectDataInicial(dateTime);
                        },
                      ),
                      buildDateSelector(
                        context,
                        "Fim do curso",
                        fimCurso,
                        onSelectDate: (dateTime) {
                          onSelectDataFinal(dateTime);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Curso",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        erro != null
            ? Text(
                erro!,
                style: const TextStyle(
                  color: Colors.red,
                ),
                textScaleFactor: 0.8,
              )
            : Container(),
        const SizedBox(
          height: 5.0,
        ),
        permissaoEditar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: editando
                    ? [
                        TextButton(
                          onPressed: () {
                            cancelarEdicao();
                          },
                          child: const Text("Cancelar"),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                            backgroundColor: Colors.red,
                            onSurface: Colors.grey,
                            textStyle: const TextStyle(fontSize: 17.0),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        TextButton(
                          onPressed: () {
                            salvarEdicao();
                          },
                          child: const Text("Salvar"),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                            onSurface: Colors.grey,
                            textStyle: const TextStyle(fontSize: 17.0),
                          ),
                        )
                      ]
                    : !permissaoAdicionarMateria
                        ? [
                            TextButton(
                              onPressed: () {
                                entrarModoEdicao();
                              },
                              child: const Text("Editar"),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(10.0),
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                                textStyle: const TextStyle(fontSize: 17.0),
                              ),
                            ),
                          ]
                        : [
                            TextButton(
                              onPressed: () {
                                entrarModoEdicao();
                              },
                              child: const Text("Editar"),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(10.0),
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                                textStyle: const TextStyle(fontSize: 17.0),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            TextButton(
                              onPressed: () {
                                entrarModoAdicaoMateria();
                              },
                              child: const Text("+ Matéria"),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(10.0),
                                primary: Colors.white,
                                backgroundColor: Colors.teal,
                                onSurface: Colors.grey,
                                textStyle: const TextStyle(fontSize: 17.0),
                              ),
                            ),
                          ],
              )
            : Container(),
      ],
    );
  }

  Widget buildDateSelector(
      BuildContext context, String hintText, DateTime dateTime,
      {OnSelectDate? onSelectDate}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Column(
        children: [
          Text(
            hintText,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (editando) {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: dateTime,
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1));
                      if (date != null && onSelectDate != null) {
                        onSelectDate(date);
                      }
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            diaComAno(
                              dateTime,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    TextEditingController textEditingController,
    String hintText, {
    int maxLines = 1,
    OnFocusFunction? onFocusFunction,
    TextInputType textInputType = TextInputType.text,
    String? erroMessage,
    OnChangeTextField? onChangeTextField,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 2.0,
        bottom: 2.0,
      ),
      child: Column(
        children: [
          Text(
            hintText,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            readOnly: !editando,
                            keyboardType: textInputType,
                            onTap: onFocusFunction,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: hintText,
                              border: InputBorder.none,
                              labelStyle: const TextStyle(color: Colors.white),
                              hintStyle: const TextStyle(color: Colors.grey),
                              // errorText: erroMessage,
                            ),
                            style: const TextStyle(color: Colors.white),
                            maxLines: maxLines,
                            onChanged: (value) {
                              if (onChangeTextField != null) {
                                onChangeTextField();
                              }
                            },
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
          erroMessage != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 2.0),
                    child: Text(
                      erroMessage,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
