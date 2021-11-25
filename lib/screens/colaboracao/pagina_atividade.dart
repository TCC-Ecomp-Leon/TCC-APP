import "package:flutter/material.dart";
import 'package:tcc_app/screens/colaboracao.dart';
import 'package:tcc_app/screens/colaboracao/atividade/correcao.dart';
import 'package:tcc_app/utils/formatacoes.dart';

class PaginaAtividadeColaboracao extends StatelessWidget {
  final MockAtividadeColaborativa atividade;

  const PaginaAtividadeColaboracao({
    required this.atividade,
    Key? key,
  }) : super(key: key);

  Widget nomeCampo(String campo) {
    return Text(
      campo,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget valorCampo(String valor) {
    return Text(
      valor,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.end,
    );
  }

  Widget informacoesDuasColunasFixas(
    BuildContext context, {
    required String campo,
    required String valor,
    bool aoContrario = false,
  }) {
    double width = MediaQuery.of(context).size.width - 90.0;
    double divisao1 = width * 0.35;
    double divisao2 = width * 0.65;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: aoContrario ? divisao2 : divisao1,
          child: nomeCampo(campo),
        ),
        SizedBox(
          width: aoContrario ? divisao1 : divisao2,
          child: valorCampo(valor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 40.0,
          right: 10.0,
          left: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        atividade.nomeAtividade,
                        textScaleFactor: 1.1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Atividade: ",
                        valor: atividade.nomeAtividade,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Tipo: ",
                        valor: textoTipoAtividade(
                          atividade.tipoAtividadeColaborativa,
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Curso: ",
                        valor: atividade.nomeCurso,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      atividade.nomeMateria != null
                          ? informacoesDuasColunasFixas(
                              context,
                              campo: "Matéria: ",
                              valor: atividade.nomeMateria!,
                            )
                          : Container(),
                      atividade.nomeMateria != null
                          ? const SizedBox(
                              height: 3.0,
                            )
                          : Container(),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Tempo colaboração: ",
                        valor: tempoColaboracao(
                          atividade.tempoColaboracao,
                        ),
                        aoContrario: true,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Data limite correção: ",
                        valor: diaComAno(
                          atividade.fechaEm,
                        ),
                        aoContrario: true,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      informacoesDuasColunasFixas(
                        context,
                        campo: "Quantidade de itens: ",
                        valor: atividade.questoes.length.toString(),
                        aoContrario: true,
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaginaCorrecaoAtividade(
                        questoes: atividade.questoes,
                      ),
                    ),
                  );
                },
                child: const Text("Colaborar"),
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
