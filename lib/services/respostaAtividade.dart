import 'package:dio/dio.dart';
import 'package:tcc_app/models/Atividade.dart';
import 'package:tcc_app/models/RespostaAtividade.dart';
import 'package:tcc_app/services/Endpoints.dart';

import 'package:tcc_app/services/requests/dio.dart';

class RespostaAtividadeAlternativaQuestaoAlternativa {
  String item;
  bool value;

  RespostaAtividadeAlternativaQuestaoAlternativa({
    required this.item,
    required this.value,
  });
}

class RespostaAtividadeAlternativaQuestao {
  String idQuestao;
  List<RespostaAtividadeAlternativaQuestaoAlternativa> alternativas;

  RespostaAtividadeAlternativaQuestao({
    required this.idQuestao,
    required this.alternativas,
  });
}

class RespostaAtividadeDissertativaQuestao {
  String idQuestao;
  bool foto;
  String? texto;
  String? imagem;

  RespostaAtividadeDissertativaQuestao({
    required this.idQuestao,
    required this.foto,
    required this.texto,
    required this.imagem,
  });
}

class RespostaAtividadeBancoDeQuestaoAlternativa {
  String item;
  bool value;

  RespostaAtividadeBancoDeQuestaoAlternativa({
    required this.item,
    required this.value,
  });
}

class RespostaAtividadeBancoDeQuestao {
  String enunciado;
  List<RespostaAtividadeBancoDeQuestaoAlternativa> alternativas;

  RespostaAtividadeBancoDeQuestao({
    required this.enunciado,
    required this.alternativas,
  });
}

class CorrecaoQuestaoDissertativaQuestao {
  String idQuestao;
  double nota;
  StatusRespostaDissertativa status;
  String comentarios;

  CorrecaoQuestaoDissertativaQuestao({
    required this.idQuestao,
    required this.nota,
    required this.status,
    required this.comentarios,
  });
}

class AvalicaoQuestaoBancoDeQuestoes {
  String idQuestao;
  bool aprovada;

  AvalicaoQuestaoBancoDeQuestoes({
    required this.idQuestao,
    required this.aprovada,
  });
}

Future<bool?> responderAtividadeAlternativa(
  String idAtividade,
  List<RespostaAtividadeAlternativaQuestao> respostas,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idAtividade,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.Alternativa),
          'respostas': respostas
              .map((resposta) => {
                    'idQuestao': resposta.idQuestao,
                    'alternativas': resposta.alternativas
                        .map((alternativa) => {
                              'item': alternativa.item,
                              'value': alternativa.value,
                            })
                        .toList()
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

Future<bool?> responderAtividadeDissertativa(
  String idAtividade,
  List<RespostaAtividadeDissertativaQuestao> respostas,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idAtividade,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.Dissertativa),
          'respostas': respostas
              .map(
                (resposta) => {
                  'idQuestao': resposta.idQuestao,
                  'resposta': resposta.foto
                      ? {'foto': true, 'imagem': resposta.imagem!}
                      : {'foto': false, 'texto': resposta.texto!}
                },
              )
              .toList()
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> responderAtividadeBancoDeQuestoes(
  String idAtividade,
  List<RespostaAtividadeBancoDeQuestao> respostas,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idAtividade,
        data: {
          'tipo': getNumeroTipoAtividade(TipoAtividade.BancoDeQuestoes),
          'respostas': respostas
              .map((resposta) => {
                    'enunciado': resposta.enunciado,
                    'alternativas': resposta.alternativas
                        .map((alternativa) => {
                              'item': alternativa.item,
                              'value': alternativa.value,
                            })
                        .toList()
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

Future<bool?> corrigirAtividadeDissertativa(
  String idResposta,
  List<CorrecaoQuestaoDissertativaQuestao> correcoes,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idResposta,
        data: correcoes
            .map((correcaoQuestao) => {
                  'idQuestao': correcaoQuestao.idQuestao,
                  'nota': correcaoQuestao.nota,
                  'status': getNumeroStatusRespostaDissertativa(
                      correcaoQuestao.status),
                  'comentarios': correcaoQuestao.comentarios,
                })
            .toList(),
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> avaliarAtividadeBancoDeQuestoes(
  String idResposta,
  String comentario,
  List<AvalicaoQuestaoBancoDeQuestoes> avaliacoes,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idResposta,
        data: {
          'comentario': comentario,
          'avaliacaoQuestoes': avaliacoes.map((avaliacao) => {
                'idQuestao': avaliacao.idQuestao,
                'aprovada': avaliacao.aprovada,
              }),
        },
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> requisitarRevisaoAtividadeDissertativa(
  String idResposta,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idResposta,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> revisarCorrecaoAtividadeDissertativa(
  String idResposta,
  List<CorrecaoQuestaoDissertativaQuestao> correcoes,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idResposta,
        data: correcoes
            .map((correcaoQuestao) => {
                  'idQuestao': correcaoQuestao.idQuestao,
                  'nota': correcaoQuestao.nota,
                  'status': getNumeroStatusRespostaDissertativa(
                      correcaoQuestao.status),
                  'comentarios': correcaoQuestao.comentarios,
                })
            .toList(),
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<List<RespostaAtividade>?> listarRespostas(
  String? idProjeto,
  String? idAtividade,
) {
  return executeRequest(
    () {
      Map<String, String> queryParameters = {};
      if (idProjeto != null) {
        queryParameters['projeto'] = idProjeto;
      }
      if (idAtividade != null) {
        queryParameters['atividade'] = idAtividade;
      }
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint,
        queryParameters: queryParameters,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['respostas'] as List<dynamic>)
          .map((json) => RespostaAtividade.fromJson(json))
          .toList();
    },
  );
}

Future<RespostaAtividade?> lerResposta(String idResposta) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint + "/" + idResposta,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return RespostaAtividade.fromJson(body['resposta']);
    },
  );
}

Future<List<RespostaAtividade>?> lerRespostasPerfilEmAtividade(
    String idPerfil, String idAtividade) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.respostaAtividadeEndpoint +
            "/" +
            idPerfil +
            "/" +
            idAtividade,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['respostas'] as List<dynamic>)
          .map((json) => RespostaAtividade.fromJson(json))
          .toList();
    },
  );
}
