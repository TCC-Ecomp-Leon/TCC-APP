import 'package:dio/dio.dart';
import 'package:tcc_app/models/Endereco.dart';
import 'package:tcc_app/models/Projeto.dart';
import 'package:tcc_app/services/Endpoints.dart';

import './requests/dio.dart';

Future<bool?> registrarProjeto(
  String nome,
  String descricao,
  String email,
  int telefone,
  String imgProjeto,
  Endereco endereco,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.aprovacaoProjetoEndpoint,
        data: {
          'nome': nome,
          'descricao': descricao,
          'email': email,
          'telefone': telefone,
          'imgProjeto': imgProjeto,
          'endereco': endereco.toJson(),
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<List<Projeto>?> obterListaDeProjetosNaoAprovados() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.aprovacaoProjetoEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['projetos'] as List<dynamic>)
          .map((json) => Projeto.fromJson(json))
          .toList();
    },
  );
}

Future<bool?> aprovacaoProjeto(String idProjeto) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.aprovacaoProjetoEndpoint + "/" + idProjeto,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<Projeto?> obterProjetoDeUmEmail(String email) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.projetoEndpoint,
        queryParameters: {
          'email': email,
        },
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return Projeto.fromJson((body['projetos'] as List<dynamic>)[0]);
    },
  );
}

Future<List<Projeto>?> obterProjetos() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.projetoEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['projetos'] as List<dynamic>)
          .map((json) => Projeto.fromJson(json))
          .toList();
    },
  );
}

Future<Projeto?> obterProjeto(String id) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.projetoEndpoint + "/" + id,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return Projeto.fromJson(body['projeto']);
    },
  );
}

Future<bool?> atualizarProjeto(
  String idProjeto,
  String? nome,
  String? descricao,
  int? telefone,
  String? imgProjeto,
  Endereco? endereco,
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
      if (telefone != null) {
        camposAtualizacao['telefone'] = telefone;
      }
      if (endereco != null) {
        camposAtualizacao['endereco'] = endereco.toJson();
      }
      if (imgProjeto != null) {
        camposAtualizacao['imgProjeto'] = imgProjeto;
      }
      return httpClient.request(
        Endpoints.projetoEndpoint + "/" + idProjeto,
        data: camposAtualizacao,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
