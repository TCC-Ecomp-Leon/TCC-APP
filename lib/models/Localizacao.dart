import 'package:freezed_annotation/freezed_annotation.dart';

part 'Localizacao.freezed.dart';
part 'Localizacao.g.dart';

@freezed
abstract class Localizacao with _$Localizacao {
  const factory Localizacao(
    double lat,
    double lng,
  ) = _Localizacao;

  factory Localizacao.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$LocalizacaoFromJson(
        json
      );
}
