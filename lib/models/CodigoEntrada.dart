import 'package:freezed_annotation/freezed_annotation.dart';

part 'CodigoEntrada.freezed.dart';
part 'CodigoEntrada.g.dart';

@freezed
abstract class CodigoEntrada with _$CodigoEntrada {
  @JsonSerializable(explicitToJson: true)
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

int getNumeroTipoCodigoDeEntrada(TipoCodigoDeEntrada _enum){
  switch (_enum) {
    case TipoCodigoDeEntrada.Professor:
      return 0;
    case TipoCodigoDeEntrada.Aluno:
      return 1;
    default:
      return 0;
  }
}

