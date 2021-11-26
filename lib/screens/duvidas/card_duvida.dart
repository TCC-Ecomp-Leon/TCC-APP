import 'package:flutter/material.dart';
import 'package:tcc_app/screens/duvidas.dart';
import 'package:tcc_app/screens/duvidas/pagina_duvida.dart';
import 'package:tcc_app/utils/formatacoes.dart';

class CardTopicoDuvida extends StatelessWidget {
  final MockDuvida duvida;

  const CardTopicoDuvida({
    required this.duvida,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 100.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaTopicoDuvida(duvida: duvida),
          ),
        );
      },
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.question_answer,
                    color: Colors.black,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text(duvida.titulo),
                  ),
                  SizedBox(
                    child: Text(
                      duvida.mensagens.isEmpty
                          ? ""
                          : diaMes(
                                duvida.mensagens.last.horario,
                              ) +
                              "\n" +
                              horario(
                                duvida.mensagens.last.horario,
                              ),
                    ),
                  )
                ],
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  duvida.mensagens.isEmpty
                      ? ""
                      : textoParaTamanhoFixo(
                          duvida.mensagens.last.mensagem,
                          30,
                        ),
                ),
              ),
            ),
          ),
          const Divider(height: 3.0, color: Colors.black),
        ],
      ),
    );
  }
}
