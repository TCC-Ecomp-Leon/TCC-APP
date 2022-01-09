import 'package:freezed_annotation/freezed_annotation.dart';

part 'Atividade.freezed.dart';
part 'Atividade.g.dart';

@freezed
abstract class QuestaoAlternativa with _$QuestaoAlternativa {
  const factory QuestaoAlternativa(
    String idQuestao,
    String enunciado,
    int peso,
    List<QuestaoAlternativaAlternativa> alternativas,
  ) = _QuestaoAlternativa;

  factory QuestaoAlternativa.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$QuestaoAlternativaFromJson(json);
}

@freezed
abstract class QuestaoAlternativaAlternativa
    with _$QuestaoAlternativaAlternativa {
  const factory QuestaoAlternativaAlternativa(
    String item,
    bool value,
  ) = _QuestaoAlternativaAlternativa;

  factory QuestaoAlternativaAlternativa.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$QuestaoAlternativaAlternativaFromJson(json);
}

@freezed
abstract class QuestaoDissertativa with _$QuestaoDissertativa {
  const factory QuestaoDissertativa(
    String idQuestao,
    String enunciado,
    int peso,
    QuestaoDissertativaRespostaEsperada respostaEsperada,
  ) = _QuestaoDissertativa;

  factory QuestaoDissertativa.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$QuestaoDissertativaFromJson(json);
}

@freezed
abstract class QuestaoDissertativaRespostaEsperada
    with _$QuestaoDissertativaRespostaEsperada {
  const factory QuestaoDissertativaRespostaEsperada(
    bool foto,
    String? texto,
    String? imagem,
  ) = _QuestaoDissertativaRespostaEsperada;

  factory QuestaoDissertativaRespostaEsperada.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$QuestaoDissertativaRespostaEsperadaFromJson(json);
}

@freezed
abstract class Atividade with _$Atividade {
  const factory Atividade(
    String id,
    String nome,
    DateTime criadoEm,
    String idProjeto,
    String idCurso,
    String? idMateria,
    TipoAtividade tipoAtividade,
    DateTime aberturaRespostas,
    DateTime fechamentoRespostas,
    List<String>? assuntos,
    double? tempoColaboracao,
    double? notaReferencia,
    List<AtividadeItens>? itens,
    DateTime? fechamentoCorrecoes,
  ) = _Atividade;

  factory Atividade.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AtividadeFromJson(json);
}

@freezed
abstract class AtividadeItens with _$AtividadeItens {
  const factory AtividadeItens(
    String idQuestao,
    String enunciado,
    double peso,
    List<QuestaoAlternativaAlternativa>? alternativas,
    QuestaoDissertativaRespostaEsperada? respostaEsperada,
  ) = _AtividadeItens;

  factory AtividadeItens.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AtividadeItensFromJson(json);
}

enum TipoAtividade {
  @JsonValue(1)
  Alternativa,
  @JsonValue(2)
  Dissertativa,
  @JsonValue(3)
  BancoDeQuestoes,
}

int getNumeroTipoAtividade(TipoAtividade tipoAtividade) {
  if (tipoAtividade == TipoAtividade.Alternativa)
    return 1;
  else if (tipoAtividade == TipoAtividade.Dissertativa)
    return 2;
  else
    return 3;
}
