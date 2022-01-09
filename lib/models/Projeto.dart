import './Curso.dart';
import './Endereco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Projeto.freezed.dart';
part 'Projeto.g.dart';

@freezed
abstract class Projeto with _$Projeto {
  const factory Projeto(
    String id,
    String nome,
    String descricao,
    int telefone,
    DateTime requisicaoEntradaEm,
    String imgProjeto,
    Endereco endereco,
    bool aprovado,
    String? idPerfilResponsavel,
    DateTime? entradaEm,
    List<Curso> cursos,
  ) = _Projeto;

  factory Projeto.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$ProjetoFromJson(
        json
      );
}
