import 'package:freezed_annotation/freezed_annotation.dart';

part 'Materia.freezed.dart';
part 'Materia.g.dart';

@freezed
abstract class Materia with _$Materia {
  const factory Materia(
    String id,
    String? idPerfilProfessor,
    String nome,
    String descricao,
    String idCurso,
  ) = _Materia;

  factory Materia.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$MateriaFromJson(
        json
      );
}
