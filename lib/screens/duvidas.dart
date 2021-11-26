import 'package:flutter/material.dart';
import 'package:tcc_app/screens/duvidas/card_duvida.dart';

class Duvidas extends StatelessWidget {
  const Duvidas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MockDuvida> duvidas = criarMockDuvidas();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0.0),
          itemCount: duvidas.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            MockDuvida duvida = duvidas[index];
            return CardTopicoDuvida(duvida: duvida);
          },
        ),
      ),
    );
  }
}

List<MockDuvida> criarMockDuvidas() {
  List<MockDuvida> ret = [];

  for (int i = 0; i < 30; i++) {
    MockDuvida duvida = MockDuvida(
      titulo: "Dúvida " + i.toString(),
      descricao:
          "(${i + 1}) Dúvida de como a interface do aplicativo irá ficar ",
      materia: i % 10 == 0 ? "Matéria " + i.toString() : null,
      cursoUniversitario: "Curso " + (i % 3).toString(),
      mensagens: [
        MockMensagemDuvida(
          mensagem:
              "Primeira mensagem no tópico de dúvida, possivelmente explicando a situação e o que não entendeu sobre algo.",
          horario: DateTime.now().subtract(const Duration(minutes: 10)),
          nomeUsuario: "Criador",
        ),
        MockMensagemDuvida(
          mensagem:
              "Segunda mensagem do topico de dúvida, possivelmente alguém dando uma explicação geral e perguntando um pouco mais sobre a dúvida.",
          horario: DateTime.now().subtract(const Duration(minutes: 10)),
          nomeUsuario: "Universitário",
        ),
        MockMensagemDuvida(
          mensagem:
              "Terceira mensagem, talvez o aluno parceiro já tenha entendido a explicação e queira fechar o tópico",
          horario: DateTime.now().subtract(const Duration(minutes: 10)),
          nomeUsuario: "Criador",
        ),
      ],
      resolvida: false,
    );

    ret.add(duvida);
  }

  return ret;
}

class MockDuvida {
  final String titulo;
  final String descricao;
  final String? materia;
  final String? cursoUniversitario;
  List<MockMensagemDuvida> mensagens;
  bool resolvida;

  MockDuvida({
    required this.titulo,
    required this.descricao,
    required this.materia,
    required this.cursoUniversitario,
    required this.mensagens,
    required this.resolvida,
  });
}

class MockMensagemDuvida {
  final String mensagem;
  final DateTime horario;
  final String nomeUsuario;

  MockMensagemDuvida({
    required this.mensagem,
    required this.horario,
    required this.nomeUsuario,
  });
}
