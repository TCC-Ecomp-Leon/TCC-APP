import './Localizacao.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Endereco.freezed.dart';
part 'Endereco.g.dart';

@freezed
abstract class Endereco with _$Endereco {
  @JsonSerializable(explicitToJson: true)
  const factory Endereco(
    String rua,
    int numero,
    String? complemento,
    String bairro,
    String cidade,
    String estado,
    int cep,
    Localizacao localizacao,
  ) = _Endereco;

  factory Endereco.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$EnderecoFromJson(
        json
      );
}
