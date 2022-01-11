import './Materia.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Curso.freezed.dart';
part 'Curso.g.dart';

@freezed
abstract class Curso with _$Curso {
  @JsonSerializable(explicitToJson: true)
  const factory Curso(
    String id,
    String idProjeto,
    String nome,
    String descricao,
    DateTime inicioCurso,
    DateTime fimCurso,
    DateTime atualizadoEm,
    List<String> turma,
    List<Materia> materias,
  ) = _Curso;

  factory Curso.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$CursoFromJson(
        json
      );
}
