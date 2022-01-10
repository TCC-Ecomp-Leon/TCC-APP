import 'package:dio/dio.dart';
import 'package:tcc_app/models/Perfil.dart';
import 'package:tcc_app/services/Endpoints.dart';

import './requests/dio.dart';

class LoginResult {
  Perfil perfil;
  String authToken;

  LoginResult({
    required this.perfil,
    required this.authToken,
  });
}

Future<LoginResult?> signIn(
  String email,
  String senha,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.autentificacaoEndpoint,
        data: {
          'email': email,
          'password': senha,
        },
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return LoginResult(
        authToken: body['authToken'] as String,
        perfil: Perfil.fromJson(body['profile']),
      );
    },
  );
}

Future<bool?> signUp(
  String email,
  String senha,
  String nome,
  int telefone,
  String cpf,
  String? codigoDeEntrada,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.autentificacaoEndpoint,
        data: {
          'email': email,
          'password': senha,
          'nome': nome,
          'telefone': telefone,
          'cpf': cpf,
          'codigoDeEntrada': codigoDeEntrada,
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> resetPassword(
  String email,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.recuperarSenhaEndpoint + "/" + email,
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> changeEmailAndPassord(
  String email,
  String password,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.alteracaoDeEmailESenhaEndpoint,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<Perfil?> reobterPerfil() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.perfilEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return Perfil.fromJson(
        body['profile'],
      );
    },
  );
}
