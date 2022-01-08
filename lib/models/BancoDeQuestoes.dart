import './RespostaAtividade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BancoDeQuestoes.freezed.dart';
part 'BancoDeQuestoes.g.dart';

@freezed
abstract class BancoDeQuestoes with _$BancoDeQuestoes {
  const factory BancoDeQuestoes(
    String id,
    DateTime criadoEm,
    String idProjeto,
    String idCurso,
    String? idMateria,
    QuestaoBancoDeQuestoes questao,
    List<String> assuntos,
  ) = _BancoDeQuestoes;

  factory BancoDeQuestoes.fromJson(
    Map<String, dynamic> json,
  ) => 
      _$BancoDeQuestoesFromJson(
        json
      );
}
