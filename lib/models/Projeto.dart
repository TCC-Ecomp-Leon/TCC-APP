import 'package:tcc_app/models/core/date_time_converter.dart';
import './Curso.dart';
import './Endereco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Projeto.freezed.dart';
part 'Projeto.g.dart';

@freezed
abstract class Projeto with _$Projeto {
  @JsonSerializable(explicitToJson: true)
  const factory Projeto(
    String id,
    String nome,
    String descricao,
    String email,
    int telefone,
    @DateTimeConverter() DateTime requisicaoEntradaEm,
    String imgProjeto,
    Endereco endereco,
    bool aprovado,
    String? idPerfilResponsavel,
    @NullableDateTimeConverter() DateTime? entradaEm,
    List<Curso>? cursos,
  ) = _Projeto;

  factory Projeto.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$ProjetoFromJson(
        json
      );
}
