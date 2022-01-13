import 'package:dio/dio.dart';
import 'package:tcc_app/models/CursoUniversitario.dart';
import 'package:tcc_app/services/Endpoints.dart';

import './requests/dio.dart';

Future<List<CursoUniversitario>?> obterCursosUniversitarios() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.cursoUniversitarioEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['cursosUniversitarios'] as List<dynamic>)
          .map((json) => CursoUniversitario.fromJson(json))
          .toList();
    },
  );
}

Future<bool?> registrarCursoUniversitario(
  String nome,
  String descricao,
  int semestresPrevistos,
  CursoUniversitario? cursoAnterior,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.cursoUniversitarioEndpoint,
        data: {
          'nome': nome,
          'descricao': descricao,
          'semestresPrevistos': semestresPrevistos,
          'cursoAnterior': cursoAnterior?.toJson(),
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> atualizarCursoUniversitario(
  String idCursoUniversitario,
  String? nome,
  String? descricao,
  int? semestresPrevistos,
  CursoUniversitario? cursoAnterior,
) {
  return executeRequest(
    () {
      Map<String, dynamic> camposAtualizacao = {};
      if (nome != null) {
        camposAtualizacao['nome'] = nome;
      }
      if (descricao != null) {
        camposAtualizacao['descricao'] = descricao;
      }
      if (semestresPrevistos != null) {
        camposAtualizacao['semestresPrevistos'] = semestresPrevistos;
      }
      if (cursoAnterior != null) {
        camposAtualizacao['cursoAnterior'] = cursoAnterior.toJson();
      }
      return httpClient.request(
        Endpoints.cursoUniversitarioEndpoint + "/" + idCursoUniversitario,
        data: camposAtualizacao,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> deletarCursoUniversitario(
  String idCursoUniversitario,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.cursoUniversitarioEndpoint + "/" + idCursoUniversitario,
        options: Options(method: 'DELETE'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
