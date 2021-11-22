import 'package:flutter/material.dart';
import 'package:tcc_app/screens/cursos/curso.dart';
import 'package:tcc_app/utils/mock_images.dart';
import 'package:tcc_app/widgets/cursos/curso_notas_atividades.dart';

class Cursos extends StatelessWidget {
  final List<MockCurso> cursos = [1, 2, 3]
      .map(
        (e) => criarMockAtividade(e),
      )
      .toList();

  Cursos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        itemCount: cursos.length,
        itemBuilder: (BuildContext context, int index) {
          MockCurso curso = cursos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Curso(),
                ),
              );
            },
            child: CardCursoNotasAtividade(curso: curso),
          );
        },
      ),
    );
  }
}

MockCurso criarMockAtividade(int numero) {
  return MockCurso(
    imagem: imgProjeto,
    nome: "Curso " + numero.toString(),
    ultimasNotas: [
      MockCursoNota(nomeMateria: "Matéria 1", nota: 5.0),
      MockCursoNota(nomeMateria: "Matéria 2", nota: 6.0),
      MockCursoNota(nomeMateria: "Matéria 3", nota: 7.0),
    ],
    proximasAtividades: [
      MockCursoAtividade(
          dia: DateTime.now().add(const Duration(days: 1)),
          nomeAtividade: "Atividade 1"),
      MockCursoAtividade(
          dia: DateTime.now().add(const Duration(days: 2)),
          nomeAtividade: "Atividade 2"),
      MockCursoAtividade(
          dia: DateTime.now().add(const Duration(days: 2)),
          nomeAtividade: "Atividade 3"),
    ],
  );
}
