import 'package:freezed_annotation/freezed_annotation.dart';

part 'CursoUniversitario.freezed.dart';
part 'CursoUniversitario.g.dart';

@freezed
abstract class CursoUniversitario with _$CursoUniversitario {
  @JsonSerializable(explicitToJson: true)
  const factory CursoUniversitario(
    String id,
    String nome,
    String descricao,
    int semestresPrevistos,
    CursoUniversitario? cursoAnterior,
  ) = _CursoUniversitario;

  factory CursoUniversitario.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$CursoUniversitarioFromJson(
        json
      );
}
