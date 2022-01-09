import 'package:dio/dio.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/services/Endpoints.dart';

import 'package:tcc_app/services/requests/dio.dart';

Future<Perfil?> obterOutroPerfil(String idPerfil) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.perfilEndpoint + "/" + idPerfil,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return Perfil.fromJson(body);
    },
  );
}

Future<Perfil?> obterPerfil() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.perfilEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return Perfil.fromJson(body['profile']);
    },
  );
}

Future<bool?> atualizarPerfil(
  String idPerfil,
  String? nome,
  int? telefone,
  String? fotoPerfil,
  String? cpf,
  String? idCursoUniversitario,
) {
  return executeRequest(
    () {
      Map<String, dynamic>? camposAtualizacaoPerfil;
      if (nome != null) {
        camposAtualizacaoPerfil ??= {};
        camposAtualizacaoPerfil['nome'] = nome;
      }
      if (nome != null) {
        camposAtualizacaoPerfil ??= {};
        camposAtualizacaoPerfil['telefone'] = telefone;
      }
      if (nome != null) {
        camposAtualizacaoPerfil ??= {};
        camposAtualizacaoPerfil['fotoPerfil'] = fotoPerfil;
      }
      if (nome != null) {
        camposAtualizacaoPerfil ??= {};
        camposAtualizacaoPerfil['cpf'] = cpf;
      }
      Map<String, dynamic>? camposAtualizacaoCursoUniversitario;
      if (idCursoUniversitario != null) {
        camposAtualizacaoCursoUniversitario ??= {};
        camposAtualizacaoCursoUniversitario['curso'] = {
          'id': idCursoUniversitario,
        };
      }
      Map<String, dynamic> camposAtualizacao = {};
      if (camposAtualizacaoPerfil != null) {
        camposAtualizacao['profile'] = camposAtualizacaoPerfil;
      }
      if (camposAtualizacaoCursoUniversitario != null) {
        camposAtualizacao['cursoUniversitario'] =
            camposAtualizacaoCursoUniversitario;
      }
      return httpClient.request(
        Endpoints.perfilEndpoint + "/" + idPerfil,
        data: camposAtualizacao,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> deletarPerfil() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.perfilEndpoint,
        options: Options(method: 'DELETE'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
