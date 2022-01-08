import 'package:freezed_annotation/freezed_annotation.dart';

part 'Duvida.freezed.dart';
part 'Duvida.g.dart';

@freezed
abstract class Duvida with _$Duvida {
  const factory Duvida(
    String id,
    String titulo,
    String descricao,
    String idAluno,
    String idCursoAluno,
    String? idMateria,
    String? idCursoUniversitario,
    bool resolvida,
    List<DuvidaMensagem> mensagens,
  ) = _Duvida;

  factory Duvida.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$DuvidaFromJson(
        json
      );
}

@freezed
abstract class DuvidaMensagem with _$DuvidaMensagem {
  const factory DuvidaMensagem(
    String idPerfil,
    DateTime horario,
    String mensagem,
  ) = _DuvidaMensagem;

  factory DuvidaMensagem.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$DuvidaMensagemFromJson(
        json
      );
}