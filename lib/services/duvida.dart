import 'package:dio/dio.dart';
import 'package:tcc_app/models/Duvida.dart';
import 'package:tcc_app/services/Endpoints.dart';

import 'package:tcc_app/services/requests/dio.dart';

Future<bool?> criarDuvida(
  String titulo,
  String descricao,
  String idCurso,
  String? idMateria,
  String primeiraMensagem,
  String? idCursoUniversitario,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.duvidaEndpoint,
        data: {
          'titulo': titulo,
          'descricao': descricao,
          'idCurso': idCurso,
          'idMateria': idMateria,
          'primeiraMensagem': primeiraMensagem,
          'idCursoUniversitario': idCursoUniversitario,
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<List<Duvida>?> obterDuvidas(String? idProjeto) {
  return executeRequest(
    () {
      Map<String, String> queryParameters = {};
      if (idProjeto != null) {
        queryParameters['projeto'] = idProjeto;
      }
      return httpClient.request(
        Endpoints.duvidaEndpoint,
        queryParameters: queryParameters,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['duvidas'] as List<dynamic>)
          .map((json) => Duvida.fromJson(json))
          .toList();
    },
  );
}

Future<bool?> responderDuvida(
  String idDuvida,
  String mensagem,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.duvidaEndpoint + "/" + idDuvida,
        data: {
          'mensagem': mensagem,
        },
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> fecharDuvida(
  String idDuvida,
) {
  return executeRequest(
    () {
      Map<String, String> queryParameters = {};
      queryParameters['fechar'] = "true";
      return httpClient.request(
        Endpoints.duvidaEndpoint + "/" + idDuvida,
        queryParameters: queryParameters,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
