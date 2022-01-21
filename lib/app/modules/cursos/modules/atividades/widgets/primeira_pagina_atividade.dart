import 'package:flutter/material.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/date_time_picker.dart';
import 'package:tcc_app/widgets/dropdown.dart';

typedef OnSelectDate = void Function(DateTime dateTime);
typedef OnChangeDropDown = void Function(int index);
typedef OnChangeTipoAtividade = void Function(TipoAtividade tipoAtividade);

class PrimeiraPaginaAtividade extends StatelessWidget {
  TipoAtividade tipoAtividade;
  TextEditingController nome;
  List<Materia> materias;
  int indiceMateriaSelecionada;
  bool editando;
  DateTime aberturaRespostas;
  DateTime fechamentoRespostas;
  DateTime fechamentoCorrecoes;
  OnSelectDate onSelectAberturaRespostas;
  OnSelectDate onSelectFechamentoRespostas;
  OnSelectDate onSelectFechamentoCorrecoes;
  OnChangeDropDown selecaoMateria;
  OnChangeTipoAtividade onChangeTipoAtividade;
  List<TextEditingController> assuntos;
  TextEditingController tempoColaboracao;
  bool jaRespondida;
  bool corrigida;
  TextEditingController notaAtividade;

  PrimeiraPaginaAtividade({
    required this.nome,
    required this.tipoAtividade,
    required this.materias,
    required this.indiceMateriaSelecionada,
    required this.editando,
    required this.aberturaRespostas,
    required this.fechamentoRespostas,
    required this.fechamentoCorrecoes,
    required this.onSelectFechamentoRespostas,
    required this.onSelectAberturaRespostas,
    required this.onSelectFechamentoCorrecoes,
    required this.selecaoMateria,
    required this.onChangeTipoAtividade,
    required this.assuntos,
    required this.tempoColaboracao,
    required this.jaRespondida,
    required this.corrigida,
    required this.notaAtividade,
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
                        buildDropDown(
                          context,
                          "Tipo",
                          "Alternativa",
                          ["Dissertativa", "Banco de questões"],
                          tipoAtividade == TipoAtividade.Alternativa
                              ? 0
                              : tipoAtividade == TipoAtividade.Dissertativa
                                  ? 1
                                  : 2,
                          (index) {
                            onChangeTipoAtividade(index == -1
                                ? TipoAtividade.Alternativa
                                : index == 0
                                    ? TipoAtividade.Dissertativa
                                    : TipoAtividade.BancoDeQuestoes);
                          },
                        ),
                        buildDropDown(
                          context,
                          "Matéria",
                          "Nenhuma",
                          materias.map((e) => e.nome).toList(),
                          indiceMateriaSelecionada + 1,
                          selecaoMateria,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        buildTextField(
                          nome,
                          "Nome",
                        ),
                        jaRespondida
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: corrigida
                                    ? const Text(
                                        "Corrigida",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : const Text(
                                        "Não corrigida",
                                        style: TextStyle(color: Colors.black),
                                      ),
                              )
                            : Container(),
                        jaRespondida && corrigida
                            ? buildTextField(
                                notaAtividade,
                                "Nota",
                              )
                            : Container(),
                        buildDateSelector(
                          context,
                          "Início da atividade",
                          aberturaRespostas,
                          onSelectDate: onSelectAberturaRespostas,
                        ),
                        buildDateSelector(
                          context,
                          "Fim da atividade",
                          fechamentoRespostas,
                          onSelectDate: onSelectFechamentoRespostas,
                        ),
                        tipoAtividade == TipoAtividade.Dissertativa
                            ? buildDateSelector(
                                context,
                                "Fim das correções",
                                fechamentoCorrecoes,
                                onSelectDate: onSelectFechamentoCorrecoes,
                              )
                            : Container(),
                        tipoAtividade != TipoAtividade.Alternativa
                            ? buildTextField(
                                tempoColaboracao,
                                "Tempo colaboração (horas)",
                                textInputType: TextInputType.number,
                              )
                            : Container(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ...assuntos
                            .map(
                              (e) => buildTextField(e, "Assunto"),
                            )
                            .toList(),
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
      child: DateTimePicker(
        actualDate: dateTime,
        beginCallendar: DateTime.now().subtract(const Duration(days: 365)),
        endCallendar: DateTime.now().add(const Duration(days: 365)),
        enabled: editando,
        onPickDate: onSelectDate,
        hintText: hintText,
      ),
    );
  }

  Widget buildTextField(
    TextEditingController textEditingController,
    String hintText, {
    int maxLines = 1,
    TextInputType textInputType = TextInputType.text,
    String? erroMessage,
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

  Widget buildDropDown(
    BuildContext context,
    String text,
    String emptyText,
    List<String> items,
    int selectedIndex,
    OnChangeDropDown onChange,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
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
                child: Container(
                  alignment: Alignment.centerRight,
                  // width: 200.0,
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: DropDown<String>(
                    alignment: Alignment.centerRight,
                    selectedIndex: selectedIndex,
                    items: [emptyText, ...items],
                    onChangeDropDown: (index) {
                      onChange(index - 1);
                    },
                    getItemText: (value) => value,
                    enabled: editando,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
