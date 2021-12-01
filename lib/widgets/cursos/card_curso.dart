import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tcc_app/screens/duvidas/criacao_duvida.dart';
import 'package:tcc_app/utils/base64_image.dart';

class CardCurso extends StatelessWidget {
  final String imagemBase64;
  final String nome;
  final String descricao;
  final String endereco;
  final String telefone;
  final String email;
  final DateTime inicio;
  final DateTime fim;
  final int quantidadeDeMaterias;
  final int quantidadeDeAtividades;
  final int quantidadeDeAtividadesFeitas;

  const CardCurso({
    required this.imagemBase64,
    required this.nome,
    required this.descricao,
    required this.endereco,
    required this.telefone,
    required this.email,
    required this.inicio,
    required this.fim,
    required this.quantidadeDeAtividades,
    required this.quantidadeDeMaterias,
    required this.quantidadeDeAtividadesFeitas,
    Key? key,
  }) : super(key: key);

  Widget _duracaoCurso() {
    int diasCurso = fim.difference(inicio).inDays;
    int diasCursados = DateTime.now().difference(inicio).inDays;
    if (diasCursados > diasCurso) {
      diasCursados = diasCurso;
    }

    return CircularPercentIndicator(
      radius: 70.0,
      lineWidth: 8.0,
      animation: true,
      percent: 0.7,
      center: Text(
        diasCursados.toString() + "/" + diasCurso.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textScaleFactor: 0.8,
      ),
      footer: const Padding(
        padding: EdgeInsets.only(
          top: 5.0,
        ),
        child: Text(
          "Dias Curso",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }

  @override
  Widget build(BuildContext context) {
    double dim = MediaQuery.of(context).size.width * 0.2;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: dim,
                  height: dim,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: imageFromBase64String(imagemBase64).image,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nome),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.5),
                        child: Text(
                          descricao,
                          textScaleFactor: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    List<String> cursos = [
                      "Curso 1",
                      "Curso 2",
                      "Curso 3",
                      nome
                    ];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginaCriacaoDuvida(
                          cursos: cursos,
                          cursoSelecionado: cursos.indexOf(nome),
                          materias: const [
                            "Matéria 1",
                            "Matéria 2",
                            "Matéria 3"
                          ],
                          materiaSelecionada: null,
                          cursosUniversitarios: const [
                            "Bacharel em C&T",
                            "Bacharel ECOMP"
                          ],
                          cursoUniversitarioSelecionado: null,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.question_answer,
                  ),
                  iconSize: 40.0,
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          descricao,
                          textScaleFactor: 0.8,
                        ),
                        Text(
                          endereco,
                          textScaleFactor: 0.8,
                        ),
                        Text(
                          telefone,
                          textScaleFactor: 0.8,
                        ),
                        Text(
                          email,
                          textScaleFactor: 0.8,
                        ),
                      ],
                    ),
                  ),
                  _duracaoCurso(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
