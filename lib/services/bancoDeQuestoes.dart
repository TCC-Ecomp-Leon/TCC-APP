import 'package:dio/dio.dart';
import 'package:tcc_app/models/BancoDeQuestoes.dart';
import 'package:tcc_app/services/Endpoints.dart';

import 'package:tcc_app/services/requests/dio.dart';

Future<List<BancoDeQuestoes>?> obterQuestoesBanco(
  String? idProjeto,
  String? idCurso,
  String? idMateria,
  List<String>? assuntos,
) {
  return executeRequest(
    () {
      Map<String, String> queryParameters = {};
      if (idProjeto != null) {
        queryParameters['projeto'] = idProjeto;
      }
      if (idCurso != null) {
        queryParameters['curso'] = idCurso;
      }
      if (assuntos != null) {
        queryParameters['assuntos'] = assuntos.toString();
      }
      return httpClient.request(
        Endpoints.bancoDeQuestaoEndpoint,
        queryParameters: queryParameters,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['questoes'] as List<dynamic>)
          .map((json) => BancoDeQuestoes.fromJson(json))
          .toList();
    },
  );
}

Future<bool?> deletarQuestaoBancoDeQuestoes(
  String idQuestao,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.bancoDeQuestaoEndpoint + "/" + idQuestao,
        options: Options(method: 'DELETE'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
