import 'package:flutter/material.dart';
import 'package:tcc_app/utils/formatacoes.dart';
import 'package:tcc_app/utils/mock_images.dart';
import 'package:tcc_app/widgets/card_overlap_image.dart';
import 'package:tcc_app/widgets/card_overlap_title.dart';

class Perfil extends StatefulWidget {
  const Perfil({
    Key? key,
  }) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final PerfilMockado perfilMockado = PerfilMockado(
    nome: "Usuário mockado",
    email: "user_mock@test.com",
    telefone: "XXXXX-XXXX",
    imagemPerfil: imgPerfil,
    entradaEm: DateTime.now().subtract(const Duration(days: 365)),
    nomeProjeto: "Projeto mockado",
    descricaoProjeto:
        "Descrição mockada de um projeto para o simples fim de visualização de onde essa informação será visualizada",
    imagemProjeto: imgProjeto,
    enderecoProjeto:
        "ENDEREÇO: Rua Teste Testando, XX, Jardim Teste, São José dos Campos - SP",
    numeroTelefoneProjeto: "YYYYY-YYYY",
    emailProjeto: "projeto_mock@test.com",
    cursoUniversitario: "Curso universitário mockado",
    cursoUniversitarioAtualizadoEm: DateTime.now(),
    quantidadeCursosAluno: 1,
    quantidadeMateriasProfessor: 2,
  );

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
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardOverlapImage(
                changeImage: (String imagem) {
                  setState(() {
                    perfilMockado.imagemPerfil = imagem;
                  });
                },
                base64image: perfilMockado.imagemPerfil,
                child: Text(
                  perfilMockado.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CardOverlapTitle(
                // editable: true,
                title: "Perfil",
                children: [
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Nome:",
                    valor: perfilMockado.nome,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Email:",
                    valor: perfilMockado.email,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Telefone:",
                    valor: perfilMockado.telefone,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Entrou em:",
                    valor: diaComAno(perfilMockado.entradaEm),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              CardOverlapImage(
                changeImage: null,
                base64image: perfilMockado.imagemProjeto,
                child: Text(
                  perfilMockado.nomeProjeto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CardOverlapTitle(
                // editable: true,
                title: "Projeto",
                children: [
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Nome:",
                    valor: perfilMockado.nomeProjeto,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Email:",
                    valor: perfilMockado.emailProjeto,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Telefone:",
                    valor: perfilMockado.numeroTelefoneProjeto,
                  ),
                  nomeCampo(
                    "Endereço projeto:",
                  ),
                  valorCampo(
                    perfilMockado.enderecoProjeto,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              CardOverlapTitle(
                // editable: true,
                title: "Universitário",
                children: [
                  nomeCampo(
                    "Curso:",
                  ),
                  valorCampo(
                    perfilMockado.cursoUniversitario,
                  ),
                  informacoesDuasColunasFixas(
                    context,
                    campo: "Atualizado em:",
                    valor:
                        diaComAno(perfilMockado.cursoUniversitarioAtualizadoEm),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              CardOverlapTitle(
                // editable: false,
                // addOption: true,
                title: "Professor",
                children: [
                  informacoesDuasColunasFixas(
                    context,
                    aoContrario: true,
                    campo: "Quantidade de matérias:",
                    valor: perfilMockado.quantidadeMateriasProfessor.toString(),
                  ),
                ],
              ),
              CardOverlapTitle(
                // editable: false,
                // addOption: true,
                title: "Aluno",
                children: [
                  informacoesDuasColunasFixas(
                    context,
                    aoContrario: true,
                    campo: "Quantidade de cursos:",
                    valor: perfilMockado.quantidadeCursosAluno.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PerfilMockado {
  //Informações sobre um usuário
  String nome;
  String email;
  String telefone;
  String imagemPerfil;
  DateTime entradaEm;

  //Informações sobre um projeto parceiro
  String nomeProjeto;
  String descricaoProjeto;
  String imagemProjeto;
  String enderecoProjeto;
  String numeroTelefoneProjeto;
  String emailProjeto;

  //Informações sobre um universitário
  String cursoUniversitario;
  DateTime cursoUniversitarioAtualizadoEm;

  //Informações sobre um professor
  int quantidadeMateriasProfessor;

  //Informações sobre um aluno de projeto parceiro
  int quantidadeCursosAluno;

  PerfilMockado({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.imagemPerfil,
    required this.entradaEm,
    required this.nomeProjeto,
    required this.descricaoProjeto,
    required this.imagemProjeto,
    required this.enderecoProjeto,
    required this.numeroTelefoneProjeto,
    required this.emailProjeto,
    required this.cursoUniversitario,
    required this.cursoUniversitarioAtualizadoEm,
    required this.quantidadeCursosAluno,
    required this.quantidadeMateriasProfessor,
  });
}
