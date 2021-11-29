import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tcc_app/screens/duvidas.dart';
import 'package:bubble/bubble.dart';
import 'package:tcc_app/utils/formatacoes.dart';

class PaginaTopicoDuvida extends StatefulWidget {
  final MockDuvida duvida;

  const PaginaTopicoDuvida({
    required this.duvida,
    Key? key,
  }) : super(key: key);

  @override
  _PaginaTopicoDuvidaState createState() => _PaginaTopicoDuvidaState();
}

class _PaginaTopicoDuvidaState extends State<PaginaTopicoDuvida> {
  TextEditingController textEditingController = TextEditingController();

  Widget buildMensagem(String mensagem, DateTime horarioMensagem) {
    BubbleStyle styleAdm = const BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Colors.blueAccent,
      borderColor: Colors.white,
      borderWidth: 1,
      elevation: 4,
      margin: BubbleEdges.only(top: 8, left: 50),
      alignment: Alignment.topRight,
    );

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Bubble(
          alignment: Alignment.center,
          color: Colors.greenAccent,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const BubbleEdges.only(top: 8),
          child: Text(
            horario(horarioMensagem) + " do dia " + diaMes(horarioMensagem),
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
        Bubble(
          style: styleAdm,
          child: Text(
            mensagem,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget buildEnviarMensagem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 22.0,
                      color: Colors.amber,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Insira sua mensagem para o tópico',
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const CircleAvatar(
            child: Icon(
              Icons.send,
              color: Colors.orange,
            ),
            backgroundColor: Colors.amberAccent,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return KeyboardVisibilityBuilder(
        builder: (BuildContext context, bool isKeyboardVisible) {
      final double bottomInsets = isKeyboardVisible ? 220 : 0.0;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              SizedBox(
                height: height - bottomInsets - 155.0,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0.0),
                  itemCount: widget.duvida.mensagens.length,
                  itemBuilder: (BuildContext context, int index) {
                    MockMensagemDuvida mensagem =
                        widget.duvida.mensagens[index];

                    return buildMensagem(
                      mensagem.mensagem,
                      mensagem.horario,
                    );
                  },
                ),
              ),
              buildEnviarMensagem(),
            ],
          ),
        ),
      );
    });
  }
}
