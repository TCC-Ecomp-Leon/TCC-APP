import 'package:flutter/material.dart';
import 'package:tcc_app/screens/cursos/atividades.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/utils/mock_images.dart';
import 'package:tcc_app/widgets/cursos/card_curso.dart';
import 'package:tcc_app/widgets/page_controller.dart';

const int diasCursados = 200;
const int diasCurso = 300;

class Curso extends StatelessWidget {
  const Curso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            CardCurso(
              imagemBase64: imgProjeto,
              nome: "CURSO - Projeto Teste",
              descricao:
                  "Texto que descreve o curso e estará no banco de dados da aplicação",
              endereco:
                  "ENDEREÇO: Rua Teste Testando, XX, Jardim Teste, São José dos Campos - SP",
              telefone: "TELEFONE: (XX) XXXXX-XXXX",
              email: "EMAIL: test_test@test.com",
              inicio: DateTime.now().subtract(const Duration(days: 30)),
              fim: DateTime.now().add(const Duration(days: 30)),
              quantidadeDeMaterias: 5,
              quantidadeDeAtividades: 5,
              quantidadeDeAtividadesFeitas: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 320.0,
              child: PageControllerImplementation(
                children: [
                  PageControllerPage(
                    child: PageControllerImplementation(
                      children: [
                        PageControllerPage(
                          child: const AtividadesCurso(fechadas: false),
                          label: "Próximas",
                        ),
                        PageControllerPage(
                          child: const AtividadesCurso(fechadas: true),
                          label: "Concluídas",
                        ),
                      ],
                      width: 280.0,
                    ),
                    label: "Atividades",
                  ),
                  PageControllerPage(
                    child: const Dummy(),
                    label: "Matérias",
                  ),
                  PageControllerPage(
                    child: const Dummy(),
                    label: "Alunos",
                  ),
                ],
                width: 410.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
