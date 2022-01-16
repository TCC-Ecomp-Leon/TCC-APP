import 'package:flutter/material.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';

typedef OnSelectDate = void Function(DateTime dateTime);

class UltimaPaginaAtividade extends StatelessWidget {
  TipoAtividade tipoAtividade;
  TextEditingController nome;
  bool editando;
  DateTime aberturaRespostas;
  DateTime fechamentoRespostas;
  DateTime fechamentoCorrecoes;
  int quantideDeQuestoes;
  String? erroMessage;

  UltimaPaginaAtividade({
    required this.nome,
    required this.tipoAtividade,
    required this.editando,
    required this.aberturaRespostas,
    required this.fechamentoRespostas,
    required this.fechamentoCorrecoes,
    required this.quantideDeQuestoes,
    required this.erroMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
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
                          nome,
                          "Nome",
                        ),
                        buildDateSelector(
                          context,
                          "Início da atividade",
                          aberturaRespostas,
                        ),
                        buildDateSelector(
                          context,
                          "Fim da atividade",
                          fechamentoRespostas,
                        ),
                        buildDateSelector(
                          context,
                          "Fim das correções",
                          fechamentoCorrecoes,
                        ),
                        buildTextField(
                          TextEditingController(
                            text: quantideDeQuestoes.toString(),
                          ),
                          "Quantidade de questões",
                          readOnly: true,
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
                    children: [
                      Text(
                        tipoAtividade == TipoAtividade.Alternativa
                            ? "Atividade alternativa"
                            : tipoAtividade == TipoAtividade.Dissertativa
                                ? "Atividade dissertativa"
                                : "Atividade de banco de questões",
                        textScaleFactor: 1.2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            erroMessage ?? "",
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Adicionar atividade",
              textScaleFactor: 0.9,
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10.0),
              primary: Colors.white,
              backgroundColor: Colors.green,
              onSurface: Colors.grey,
              textStyle: const TextStyle(fontSize: 17.0),
            ),
          ),
        ],
      ),
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
    TextInputType textInputType = TextInputType.text,
    String? erroMessage,
    bool readOnly = false,
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
                            readOnly: readOnly,
                            keyboardType: textInputType,
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
