import 'package:dio/dio.dart';
import 'package:tcc_app/models/Atividade.dart';
import 'package:tcc_app/services/Endpoints.dart';

import 'package:tcc_app/services/requests/dio.dart';

class CriarAtividadeQuestaoAlternativaItem {
  String item;
  bool value;
  CriarAtividadeQuestaoAlternativaItem({
    required this.item,
    required this.value,
  });
}

class CriarAtividadeQuestaoAlternativa {
  String enunciado;
  double peso;
  List<CriarAtividadeQuestaoAlternativaItem> alternativas;

  CriarAtividadeQuestaoAlternativa({
    required this.enunciado,
    required this.peso,
    required this.alternativas,
  });
}

class CriarAtividadeQuestaoDissertativa {
  String enunciado;
  double peso;
  QuestaoDissertativaRespostaEsperada respostaEsperada;

  CriarAtividadeQuestaoDissertativa({
    required this.enunciado,
    required this.peso,
    required this.respostaEsperada,
  });
}

Future<bool?> criarAtividadeAlternativa(
  String nome,
  String idProjeto,
  String idCurso,
  String? idMateria,
  DateTime aberturaRespostas,
  DateTime fechamentoRespostas,
  double notaReferencia,
  List<CriarAtividadeQuestaoAlternativa> questoes,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.atividadeEndpoint,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.Alternativa),
          'nome': nome,
          'idProjeto': idProjeto,
          'idCurso': idCurso,
          'idMateria': idMateria,
          'aberturaRespostas': aberturaRespostas.toString(),
          'fechamentoRespostas': fechamentoRespostas.toString(),
          'notaReferencia': notaReferencia,
          'questoes': questoes
              .map((questao) => {
                    'enunciado': questao.enunciado,
                    'peso': questao.peso,
                    'alternativas': questao.alternativas
                        .map((alternativa) => {
                              'item': alternativa.item,
                              'value': alternativa.value,
                            })
                        .toList(),
                  })
              .toList(),
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> criarAtividadeDissertativa(
  String nome,
  String idProjeto,
  String idCurso,
  String? idMateria,
  DateTime aberturaRespostas,
  DateTime fechamentoRespostas,
  DateTime fechamentoCorrecoes,
  double notaReferencia,
  double tempoColaboracao,
  List<CriarAtividadeQuestaoDissertativa> questoes,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.atividadeEndpoint,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.Dissertativa),
          'nome': nome,
          'idProjeto': idProjeto,
          'idCurso': idCurso,
          'idMateria': idMateria,
          'aberturaRespostas': aberturaRespostas.toString(),
          'fechamentoRespostas': fechamentoRespostas.toString(),
          'fechamentoCorrecoes': fechamentoCorrecoes.toString(),
          'notaReferencia': notaReferencia,
          'tempoColaboracao': tempoColaboracao,
          'questoes': questoes
              .map((questao) => {
                    'enunciado': questao.enunciado,
                    'peso': questao.peso,
                    'respostaEsperada': questao.respostaEsperada.foto
                        ? {
                            'foto': true,
                            'imagem': questao.respostaEsperada.imagem!,
                          }
                        : {
                            'foto': false,
                            'texto': questao.respostaEsperada.texto!,
                          }
                  })
              .toList(),
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> criarAtividadeBancoDeQuestoes(
  String nome,
  String idProjeto,
  String idCurso,
  String? idMateria,
  DateTime aberturaRespostas,
  DateTime fechamentoRespostas,
  double tempoColaboracao,
  List<String> assuntos,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.atividadeEndpoint,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.BancoDeQuestoes),
          'nome': nome,
          'idProjeto': idProjeto,
          'idCurso': idCurso,
          'idMateria': idMateria,
          'aberturaRespostas': aberturaRespostas.toString(),
          'fechamentoRespostas': fechamentoRespostas.toString(),
          'tempoColaboracao': tempoColaboracao,
          'assuntos': assuntos,
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<List<Atividade>?> obterListaDeAtividades(
  String idCurso,
  bool? abertas,
) {
  return executeRequest(
    () {
      Map<String, String> queryParameters = {};
      if (abertas != null) {
        queryParameters['abertas'] = abertas.toString();
      }
      return httpClient.request(
        Endpoints.atividadeEndpoint + "/" + idCurso,
        queryParameters: queryParameters,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['atividades'] as List<dynamic>)
          .map((json) => Atividade.fromJson(json))
          .toList();
    },
  );
}

Future<bool?> removerAtividade(
  String idAtividade,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.atividadeEndpoint + "/" + idAtividade,
        options: Options(method: 'DELETE'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
