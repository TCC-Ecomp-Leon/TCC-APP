import 'package:search_cep/search_cep.dart';

Future<ViaCepInfo?> pesquisaCep(String entrada) async {
  final viaCepSearchCep = ViaCepSearchCep();
  final result = await viaCepSearchCep.searchInfoByCep(
    cep: entrada.replaceAll("-", ""),
  );
  if (result.isRight()) {
    return result.toOption().toNullable();
  }
  return null;
}
