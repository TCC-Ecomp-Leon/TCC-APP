import 'package:freezed_annotation/freezed_annotation.dart';

part 'CodigoEntrada.freezed.dart';
part 'CodigoEntrada.g.dart';

@freezed
abstract class CodigoEntrada with _$CodigoEntrada {
  const factory CodigoEntrada(
    String id,
    String idProjeto,
    DateTime geradoEm,
    bool usado,
    DateTime? usadoEm,
    String? idPerfilUsou,
    TipoCodigoDeEntrada tipo,
    String idCurso,
    String? idMateria,
  ) = _CodigoEntrada;

  factory CodigoEntrada.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$CodigoEntradaFromJson(
        json
      );
}

enum TipoCodigoDeEntrada {
  @JsonValue(0)
  Professor,
  @JsonValue(1)
  Aluno,
}
