import 'package:flutter/material.dart';
import 'package:tcc_app/screens/colaboracao.dart';
import 'package:tcc_app/screens/colaboracao/colaboradas/lista.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';

class CardAtividadesColaboradas extends StatelessWidget {
  final List<MockAtividadeColaborada> colaboracoes;

  const CardAtividadesColaboradas({
    required this.colaboracoes,
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
    double divisao1 = width * 0.3;
    double divisao2 = width * 0.7;
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
    ColaboracoesResumo resumo = resumoColaboracoes(colaboracoes);

    return CardOverlapTitle(
      title: "Colaborações realizadas",
      children: [
        informacoesDuasColunasFixas(
          context,
          campo: "Quantidade de colaborações: ",
          valor: colaboracoes.length.toString(),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Tempo Total:",
          valor: formatarMinutosHoras(resumo.tempoTotal),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Atividades aprovadas:",
          valor: resumo.quantidadeAprovada.toString(),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Tempo Aprovado:",
          valor: formatarMinutosHoras(resumo.tempoAprovado),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Tempo Pendente:",
          valor: formatarMinutosHoras(resumo.tempoPendente),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Tempo Emitido:",
          valor: formatarMinutosHoras(resumo.tempoEmitido),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        informacoesDuasColunasFixas(
          context,
          campo: "Tempo em Requisição:",
          valor: formatarMinutosHoras(resumo.tempoEmRequisicao),
          aoContrario: true,
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaColaboracoes(
                  colaboracoes: colaboracoes,
                ),
              ),
            );
          },
          child: const Text("Visualizar colaborações"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            primary: Colors.white,
            backgroundColor: Colors.teal,
            onSurface: Colors.grey,
            textStyle: const TextStyle(fontSize: 20.0),
          ),
        )
      ],
    );
  }
}

class ColaboracoesResumo {
  final int tempoTotal;

  final int quantidadeAprovada;
  final int tempoAprovado;
  final int tempoPendente;

  final int tempoEmitido;
  final int tempoEmRequisicao;

  ColaboracoesResumo({
    required this.tempoTotal,
    required this.quantidadeAprovada,
    required this.tempoAprovado,
    required this.tempoPendente,
    required this.tempoEmitido,
    required this.tempoEmRequisicao,
  });
}

ColaboracoesResumo resumoColaboracoes(
    List<MockAtividadeColaborada> colaboracoes) {
  return ColaboracoesResumo(
    tempoTotal: colaboracoes
        .map((e) => e.tempoColaboracao)
        .reduce((value, element) => value + element),
    quantidadeAprovada: colaboracoes
        .map((e) => e.aprovada ? 1 : 0)
        .reduce((value, element) => value + element),
    tempoAprovado: colaboracoes
        .map((e) => e.aprovada ? e.tempoColaboracao : 0)
        .reduce((value, element) => value + element),
    tempoPendente: colaboracoes
        .map((e) => !e.aprovada ? e.tempoColaboracao : 0)
        .reduce((value, element) => value + element),
    tempoEmitido: colaboracoes
        .map((e) => e.horasEmitidas ? e.tempoColaboracao : 0)
        .reduce((value, element) => value + element),
    tempoEmRequisicao: colaboracoes
        .map((e) =>
            e.horasRequisitadas && !e.horasEmitidas ? e.tempoColaboracao : 0)
        .reduce((value, element) => value + element),
  );
}
