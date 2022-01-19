import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tcc_app/app/modules/cursos/modules/atividades/modules/respostas_controller.dart';
import 'package:tcc_app/models/Atividade.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/widgets/loading.dart';
import 'package:tcc_app/widgets/refresh_list.dart';

class RespostasView extends GetView<RespostasController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: RefreshListView(
            header: Column(
              children: [
                cardAtividade(context),
                cardTurma(context),
              ],
            ),
            bottomOffset: 300.0,
            child: controller.carregando
                ? Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    child: const Loading(
                        color: Colors.white, circleTimeSeconds: 2),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0.0),
                    itemCount: controller.respostas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardAlunoResposta(
                        context,
                        controller.respostas[index],
                      );
                    },
                  ),
            refreshController: controller.refreshController,
            onRefresh: () => controller.carregarRespostas(
              pullRefresh: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget cardAtividade(BuildContext context) {
    final Atividade atividade = controller.atividade;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Nome:"),
            Text(atividade.nome),
            const Text("Tipo:"),
            Text(atividade.tipoAtividade == TipoAtividade.Alternativa
                ? "Alternativa"
                : atividade.tipoAtividade == TipoAtividade.Dissertativa
                    ? "Dissertativa"
                    : "Banco de questões"),
            const Text("Abertura respostas: "),
            Text(
              diaComAno(atividade.aberturaRespostas) +
                  " " +
                  horario(atividade.aberturaRespostas),
            ),
            const Text("Fechamento respostas: "),
            Text(
              diaComAno(atividade.fechamentoRespostas) +
                  " " +
                  horario(atividade.fechamentoRespostas),
            ),
            const Text("Fechamento correções: "),
            atividade.fechamentoCorrecoes != null
                ? Text(
                    diaComAno(atividade.fechamentoCorrecoes!) +
                        " " +
                        horario(atividade.fechamentoCorrecoes!),
                  )
                : const Text("Não se aplica")
          ],
        ),
      ),
    );
  }

  Widget cardAlunoResposta(
    BuildContext context,
    RespostasControllerInformacaoAluno aluno,
  ) {
    final bool corrigida = controller.atividadeCorrigida(aluno.resposta);
    final String textoNota = controller.notaCorrecao(aluno.resposta);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 150.0,
              child: Text(aluno.perfil.nome),
            ),
            Icon(
              aluno.respondeu
                  ? corrigida
                      ? Icons.check
                      : Icons.priority_high
                  : Icons.check_box_outline_blank_outlined,
              color: corrigida ? Colors.yellow : Colors.red,
            ),
            Row(
              children: [
                Icon(
                  aluno.respondeu ? Icons.check : Icons.close,
                  color: aluno.respondeu ? Colors.green : Colors.red,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(textoNota),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget cardTurma(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Turma: ",
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
