import 'package:dio/dio.dart';
import 'package:tcc_app/models/CodigoEntrada.dart';
import 'package:tcc_app/services/Endpoints.dart';

import './requests/dio.dart';

Future<List<CodigoEntrada>?> obterCodigosDeEntrada() {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.codigoDeEntradaEndpoint,
        options: Options(method: 'GET'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return (body['codigos'] as List<dynamic>)
          .map((json) => CodigoEntrada.fromJson(json))
          .toList();
    },
  );
}

Future<CodigoEntrada?> registrarCodigoDeEntrada(
  TipoCodigoDeEntrada tipo,
  String idCurso,
  String? idMateria,
) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.codigoDeEntradaEndpoint,
        data: {
          'tipo': getNumeroTipoCodigoDeEntrada(tipo),
          'idCurso': idCurso,
          'idMateria': idMateria,
        },
        options: Options(method: 'POST'),
      );
    },
    (Response<dynamic> response) {
      final body = response.data as Map<String, dynamic>;
      return CodigoEntrada.fromJson(body['codigo']);
    },
  );
}

Future<bool?> usarCodigoDeEntrada(String idCodigo) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.codigoDeEntradaEndpoint + "/" + idCodigo,
        options: Options(method: 'PUT'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}

Future<bool?> removerCodigoDeEntrada(String idCodigo) {
  return executeRequest(
    () {
      return httpClient.request(
        Endpoints.codigoDeEntradaEndpoint + "/" + idCodigo,
        options: Options(method: 'DELETE'),
      );
    },
    (Response<dynamic> response) {
      return true;
    },
  );
}
