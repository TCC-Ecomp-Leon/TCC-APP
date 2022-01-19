import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/data/collections/collections_controller.dart';
import 'package:tcc_app/models/index.dart';
import 'package:tcc_app/services/atividade.dart';
import 'package:tcc_app/services/respostaAtividade.dart';
import 'package:tcc_app/utils/iterable.dart';

// Esse controlador deverá gerenciar uma atividade como um todo,
// ou seja, visualizar suas informações, lista de questões,
// além da possibilidade de um modo de criação de atividade,
// editando seu nome e outros informações e inserindo cada uma das questões

class AtividadeController extends GetxController {
  @override
  void onInit() {
    Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
    curso = args['curso'];
    TipoAtividade tipoAtividade = TipoAtividade.Alternativa;
    if (args.keys.contains('tipo')) {
      tipoAtividade = args['tipo'] as TipoAtividade;
    }
    tipoUsoController = TipoUsoControllerAtividades.Criando;
    if (args.keys.contains('uso')) {
      tipoUsoController = args['uso'] as TipoUsoControllerAtividades;
    }
    if (args.keys.contains('atividade')) {
      atividade = args['atividade'] as Atividade;
      if (args.keys.contains('resposta')) {
        resposta = args['resposta'] as RespostaAtividade;
      }
      if (tipoUsoController == TipoUsoControllerAtividades.Visualizando) {
        _informacoesAtividade =
            InformacoesAtividade.fromResposta(atividade!, resposta!).obs;
      } else {
        _informacoesAtividade =
            InformacoesAtividade.fromAtividade(atividade!).obs;
      }
    } else {
      _informacoesAtividade =
          InformacoesAtividade(tipoAtividade: tipoAtividade).obs;
    }
    super.onInit();
  }

  final CollectionsController collectionsController =
      Get.find<CollectionsController>();

  late final Atividade? atividade;
  late final RespostaAtividade? resposta;

  late Curso curso;
  late TipoUsoControllerAtividades tipoUsoController;
  late Rx<InformacoesAtividade> _informacoesAtividade;
  final Rx<int> _indiceMateriaSelecionada = (-1).obs;
  final Rx<bool> _adicionandoAtividade = false.obs;
  final Rx<bool> _respondendoAtividade = false.obs;
  final Rx<bool> _corrigindoAtividade = false.obs;

  final Rx<String> _erro = "".obs;

  alterarTipoAtividade(TipoAtividade tipo) {
    _informacoesAtividade.value.alterarTipoAtividade(tipo);
    _informacoesAtividade.refresh();
  }

  List<Materia> get listaMaterias => curso.materias;
  TipoAtividade get tipoAtividade => _informacoesAtividade.value.tipoAtividade;
  int get indiceMateriaSelecionada => _indiceMateriaSelecionada.value;
  DateTime get aberturaRespostas =>
      _informacoesAtividade.value.aberturaRespostas;
  DateTime get fechamentoRespostas =>
      _informacoesAtividade.value.fechamentoRespostas;
  DateTime get fechamentoCorrecoes =>
      _informacoesAtividade.value.fechamentoCorrecoes;

  String? get erro => _erro.value.isEmpty ? null : _erro.value;

  TextEditingController get nome => _informacoesAtividade.value.nome;
  TextEditingController get tempoColaborao =>
      _informacoesAtividade.value.tempoColaborao;
  TextEditingController get notaAtividade => _informacoesAtividade.value.nota;
  List<InformacoesQuestoes> get questoes =>
      _informacoesAtividade.value.questoes;
  bool get adicionandoAtividade => _adicionandoAtividade.value;
  bool get respondendoAtividade => _respondendoAtividade.value;
  bool get corrigindoAtividade => _corrigindoAtividade.value;
  List<TextEditingController> get assuntos =>
      _informacoesAtividade.value.assuntos;

  bool get corrigida => _informacoesAtividade.value.corrigida;

  adicionarQuestao() {
    if (tipoAtividade == TipoAtividade.Alternativa) {
      _informacoesAtividade.value.questoes.add(
        InformacoesQuestoes.alternativa(),
      );
    } else if (tipoAtividade == TipoAtividade.Dissertativa) {
      _informacoesAtividade.value.questoes.add(
        InformacoesQuestoes.dissertativa(),
      );
    }
    _informacoesAtividade.refresh();
  }

  removerQuestao(int index) {
    if (_informacoesAtividade.value.questoes.length > 1) {
      _informacoesAtividade.value.questoes.removeAt(index);
      _informacoesAtividade.refresh();
    }
  }

  setarImagemRespostaEsperada(int index, String imagem) {
    _informacoesAtividade.value.questoes[index].imagemRespostaEsperada = imagem;
    _informacoesAtividade.value.questoes[index].respostaImagem = true;
    _informacoesAtividade.refresh();
  }

  setarImagemResposta(int index, String imagem) {
    _informacoesAtividade.value.questoes[index].imagemRespostaInserida = imagem;
    _informacoesAtividade.value.questoes[index].respostaImagem = true;
    _informacoesAtividade.refresh();
  }

  atribuirNotaQuestao(int index, double nota) {
    _informacoesAtividade.value.questoes[index].notaCorrecao = nota;
    _informacoesAtividade.refresh();
  }

  alterarParaRespostaTexto(int index) {
    _informacoesAtividade.value.questoes[index].respostaImagem = false;
    _informacoesAtividade.refresh();
  }

  adicionarAlternativa(int index) {
    _informacoesAtividade.value.questoes[index].alternativas
        .add(TextEditingController());
    _informacoesAtividade.refresh();
  }

  removerAlternativa(int indexQuestao, int indexAlternativa) {
    _informacoesAtividade.value.questoes[indexQuestao].alternativas
        .removeAt(indexAlternativa);
    _informacoesAtividade.refresh();
  }

  adicionarAssunto(String assunto) {
    _informacoesAtividade.value.assuntos.add(TextEditingController());
    _informacoesAtividade.refresh();
  }

  removerAssunto(int index) {
    _informacoesAtividade.value.assuntos.removeAt(index);
    _informacoesAtividade.refresh();
  }

  alterarAberturaRespostas(DateTime dateTime) {
    _informacoesAtividade.value.aberturaRespostas = dateTime;
    _informacoesAtividade.refresh();
  }

  alterarFechamentoRespostas(DateTime dateTime) {
    _informacoesAtividade.value.fechamentoRespostas = dateTime;
    _informacoesAtividade.refresh();
  }

  alterarFechamentoCorrecoes(DateTime dateTime) {
    _informacoesAtividade.value.fechamentoCorrecoes = dateTime;
    _informacoesAtividade.refresh();
  }

  alterarAlternativaCorreta(int indexQuestao, int indexAlternativa) {
    _informacoesAtividade.value.questoes[indexQuestao].alternativaCorreta =
        indexAlternativa;
    _informacoesAtividade.refresh();
  }

  selecionarRepostaAlternativa(int indexQuestao, int indexAlternativa) {
    _informacoesAtividade.value.questoes[indexQuestao].alternativaSelecionada =
        indexAlternativa;
    _informacoesAtividade.refresh();
  }

  salvarAtividade() async {
    String? erro = _informacoesAtividade.value.procurarErrosCriacaoAtividade();
    _erro.value = erro ?? "";
    if (_erro.value.isEmpty) {
      _adicionandoAtividade.value = true;

      String nome = _informacoesAtividade.value.nome.text;
      bool? result;
      if (_informacoesAtividade.value.tipoAtividade ==
          TipoAtividade.Alternativa) {
        result = await criarAtividadeAlternativa(
          nome,
          curso.idProjeto,
          curso.id,
          _indiceMateriaSelecionada.value != -1
              ? listaMaterias[_indiceMateriaSelecionada.value].id
              : null,
          aberturaRespostas,
          fechamentoRespostas,
          tryParseDouble(_informacoesAtividade.value.notaReferencia.text)!,
          _informacoesAtividade.value.questoes
              .map(
                (e) => CriarAtividadeQuestaoAlternativa(
                    enunciado: e.enunciado.text,
                    peso: 1,
                    alternativas: e.alternativas
                        .mapIndexed(
                          (element, index) =>
                              CriarAtividadeQuestaoAlternativaItem(
                            item: element.text,
                            value: index == e.alternativaCorreta,
                          ),
                        )
                        .toList()),
              )
              .toList(),
        );
      } else if (_informacoesAtividade.value.tipoAtividade ==
          TipoAtividade.Dissertativa) {
        result = await criarAtividadeDissertativa(
          nome,
          curso.idProjeto,
          curso.id,
          _indiceMateriaSelecionada.value != -1
              ? listaMaterias[_indiceMateriaSelecionada.value].id
              : null,
          aberturaRespostas,
          fechamentoRespostas,
          fechamentoCorrecoes,
          tryParseDouble(_informacoesAtividade.value.notaReferencia.text)!,
          tryParseDouble(_informacoesAtividade.value.tempoColaborao.text)!,
          _informacoesAtividade.value.questoes
              .map(
                (e) => CriarAtividadeQuestaoDissertativa(
                    enunciado: e.enunciado.text,
                    peso: 1,
                    respostaEsperada: QuestaoDissertativaRespostaEsperada(
                      e.respostaImagem,
                      e.textoRespostaEsperada.text,
                      e.imagemRespostaEsperada,
                    )),
              )
              .toList(),
        );
      } else {
        result = await criarAtividadeBancoDeQuestoes(
          nome,
          curso.idProjeto,
          curso.id,
          _indiceMateriaSelecionada.value != -1
              ? listaMaterias[_indiceMateriaSelecionada.value].id
              : null,
          aberturaRespostas,
          fechamentoRespostas,
          tryParseDouble(_informacoesAtividade.value.tempoColaborao.text)!,
          _informacoesAtividade.value.assuntos.map((e) => e.text).toList(),
        );
      }

      if (result != null && result) {
        _erro.value = "";
      } else {
        _erro.value = "Erro ao adicionar a atividade";
      }

      _adicionandoAtividade.value = false;
      if (_erro.value.isEmpty) {
        Get.back();
      }
    }
  }

  entregarAtividade() async {
    if (atividade == null) return;
    String? erro =
        _informacoesAtividade.value.procurarErrosResponderAtividade();
    _erro.value = erro ?? "";

    if (_erro.value.isEmpty) {
      _respondendoAtividade.value = true;
      bool? result;
      if (tipoAtividade == TipoAtividade.Alternativa) {
        result = await responderAtividadeAlternativa(
          atividade!.id,
          _informacoesAtividade.value.questoes
              .mapIndexed(
                (questao, indiceQuestao) => RespostaAtividadeAlternativaQuestao(
                  alternativas: questao.alternativas
                      .mapIndexed(
                        (alternativa, indexAlternativa) =>
                            RespostaAtividadeAlternativaQuestaoAlternativa(
                          item: alternativa.text,
                          value: indexAlternativa ==
                              questao.alternativaSelecionada,
                        ),
                      )
                      .toList(),
                  idQuestao: atividade!.itens![indiceQuestao].idQuestao,
                ),
              )
              .toList(),
        );
      } else if (tipoAtividade == TipoAtividade.Dissertativa) {
        result = await responderAtividadeDissertativa(
          atividade!.id,
          _informacoesAtividade.value.questoes
              .mapIndexed(
                (questao, indiceQuestao) =>
                    RespostaAtividadeDissertativaQuestao(
                  idQuestao: atividade!.itens![indiceQuestao].idQuestao,
                  foto: questao.respostaImagem,
                  texto: questao.textoRespostaInserida.text,
                  imagem: questao.imagemRespostaInserida,
                ),
              )
              .toList(),
        );
      } else {
        result = await responderAtividadeBancoDeQuestoes(
          atividade!.id,
          _informacoesAtividade.value.questoes
              .map(
                (questao) => RespostaAtividadeBancoDeQuestao(
                  enunciado: questao.enunciado.text,
                  alternativas: questao.alternativas
                      .mapIndexed(
                        (alternativa, indiceAlternativa) =>
                            RespostaAtividadeBancoDeQuestaoAlternativa(
                          item: alternativa.text,
                          value:
                              indiceAlternativa == questao.alternativaCorreta,
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        );
      }

      if (result != null && result) {
        _erro.value = "";
      } else {
        _erro.value = "Falha ao responder a atividade";
      }

      _respondendoAtividade.value = false;
      if (_erro.value.isEmpty) {
        Get.back();
      }
    }
  }

  corrigirAtividade() async {
    String? erro = _informacoesAtividade.value.procurarErrosCorrecao();
    _erro.value = erro ?? "";
    if (_erro.value.isEmpty) {
      _corrigindoAtividade.value = true;

      bool? result = await corrigirAtividadeDissertativa(
        resposta!.id,
        _informacoesAtividade.value.questoes
            .mapIndexed(
              (questao, indiceQuestao) => CorrecaoQuestaoDissertativaQuestao(
                idQuestao: atividade!.itens![indiceQuestao].idQuestao,
                nota: questao.notaCorrecao,
                status: questao.notaCorrecao == 10
                    ? StatusRespostaDissertativa.Certo
                    : questao.notaCorrecao > 4
                        ? StatusRespostaDissertativa.ParcialmenteCerto
                        : StatusRespostaDissertativa.Errado,
                comentarios: questao.comentarioCorrecao.text,
              ),
            )
            .toList(),
      );

      if (result != null && result) {
        _erro.value = "";
      } else {
        _erro.value = "Erro ao corrigir a atividade";
      }

      _corrigindoAtividade.value = false;
      if (_erro.value.isEmpty) {
        Get.back();
      }
    }
  }

  selecionarMateria(int index) {
    _indiceMateriaSelecionada.value = index;
    _indiceMateriaSelecionada.refresh();
  }
}

enum TipoUsoControllerAtividades {
  Criando,
  Visualizando,
  Respondendo,
}

class InformacoesAtividade {
  late TextEditingController nome;
  late List<InformacoesQuestoes> questoes;
  late List<TextEditingController> assuntos;
  late TextEditingController notaReferencia;
  late TextEditingController tempoColaborao;
  late DateTime aberturaRespostas;
  late DateTime fechamentoRespostas;
  late DateTime fechamentoCorrecoes;
  late TipoAtividade tipoAtividade;

  late bool corrigida;
  late TextEditingController nota;

  InformacoesAtividade.fromResposta(
    Atividade atividade,
    RespostaAtividade respostaAtividade,
  ) {
    tipoAtividade = respostaAtividade.tipo;
    nome = TextEditingController(text: atividade.nome);
    assuntos = atividade.assuntos != null
        ? atividade.assuntos!
            .map((e) => TextEditingController(text: e))
            .toList()
        : [];
    notaReferencia = TextEditingController(
      text: atividade.notaReferencia != null
          ? atividade.notaReferencia!.toStringAsFixed(2)
          : null,
    );
    tempoColaborao = TextEditingController(
      text: atividade.tempoColaboracao != null
          ? atividade.tempoColaboracao!.toStringAsFixed(3)
          : null,
    );
    aberturaRespostas = atividade.aberturaRespostas;
    fechamentoRespostas = atividade.fechamentoRespostas;
    fechamentoCorrecoes = atividade.fechamentoCorrecoes != null
        ? atividade.fechamentoCorrecoes!
        : DateTime.now();

    corrigida = (tipoAtividade == TipoAtividade.Dissertativa &&
            respostaAtividade.corrigida == true) ||
        (tipoAtividade == TipoAtividade.Alternativa &&
            respostaAtividade.encerrada == true);
    nota = TextEditingController(
        text: corrigida ? respostaAtividade.nota!.toStringAsFixed(3) : "-1");

    if (tipoAtividade == TipoAtividade.Alternativa) {
      questoes = respostaAtividade.respostas
          .mapIndexed(
            (e, index) => InformacoesQuestoes.fromRespostaAlternativa(
              atividade.itens![index],
              e,
              respostaAtividade.encerrada!,
            ),
          )
          .toList();
    } else if (tipoAtividade == TipoAtividade.Dissertativa) {
      questoes = respostaAtividade.respostas
          .mapIndexed(
            (e, i) => InformacoesQuestoes.fromRespostaDissertativa(
              atividade.itens![i],
              e,
              corrigida,
              respostaAtividade.correcaoQuestao?[i],
            ),
          )
          .toList();
    } else {
      questoes = respostaAtividade.respostas
          .map(
            (e) => InformacoesQuestoes.fromRespostaBancoDeQuestoes(
              e,
              respostaAtividade.avaliada!,
            ),
          )
          .toList();
    }
  }

  InformacoesAtividade.fromAtividade(Atividade atividade) {
    tipoAtividade = atividade.tipoAtividade;
    nome = TextEditingController(text: atividade.nome);
    questoes = atividade.itens != null
        ? atividade.itens!
            .map((e) => InformacoesQuestoes.fromQuestao(
                  e,
                  atividade.tipoAtividade,
                ))
            .toList()
        : atividade.tipoAtividade == TipoAtividade.BancoDeQuestoes
            ? [InformacoesQuestoes.alternativa()]
            : [];
    assuntos = atividade.assuntos != null
        ? atividade.assuntos!
            .map((e) => TextEditingController(text: e))
            .toList()
        : [];
    notaReferencia = TextEditingController(
      text: atividade.notaReferencia != null
          ? atividade.notaReferencia!.toStringAsFixed(2)
          : null,
    );
    tempoColaborao = TextEditingController(
      text: atividade.tempoColaboracao != null
          ? atividade.tempoColaboracao!.toStringAsFixed(3)
          : null,
    );
    aberturaRespostas = atividade.aberturaRespostas;
    fechamentoRespostas = atividade.fechamentoRespostas;
    fechamentoCorrecoes = atividade.fechamentoCorrecoes != null
        ? atividade.fechamentoCorrecoes!
        : DateTime.now();
    corrigida = false;
    nota = TextEditingController();
  }

  InformacoesAtividade({
    required this.tipoAtividade,
  }) {
    nome = TextEditingController();
    questoes = tipoAtividade == TipoAtividade.Alternativa
        ? [InformacoesQuestoes.alternativa()]
        : tipoAtividade == TipoAtividade.Dissertativa
            ? [InformacoesQuestoes.dissertativa()]
            : [];
    assuntos = [];
    tempoColaborao = TextEditingController();
    aberturaRespostas = DateTime.now();
    fechamentoRespostas = DateTime.now();
    fechamentoCorrecoes = DateTime.now();
    notaReferencia = TextEditingController(text: '10');
    corrigida = false;
    nota = TextEditingController();
  }

  alterarTipoAtividade(TipoAtividade tipoAtividade) {
    if (this.tipoAtividade != tipoAtividade) {
      this.tipoAtividade = tipoAtividade;

      if (tipoAtividade == TipoAtividade.BancoDeQuestoes) {
        questoes = [];
      } else {
        if (tipoAtividade == TipoAtividade.Dissertativa) {
          questoes.forEach((element) {
            element.alternativa = false;
          });
        } else {
          questoes.forEach((element) {
            element.alternativa = true;
          });
          if (questoes.isEmpty) {
            questoes.add(InformacoesQuestoes.alternativa());
          }
        }
      }
    }
  }

  String? procurarErrosCriacaoAtividade() {
    if (nome.text.isEmpty) {
      return "Necessário preencher o nome da atividade";
    }
    if (tipoAtividade == TipoAtividade.BancoDeQuestoes ||
        tipoAtividade == TipoAtividade.Dissertativa) {
      if (tempoColaborao.text.isEmpty) {
        return "Necesssário preencher o tempo de colaboração";
      }
      double? parsed = tryParseDouble(tempoColaborao.text);
      if (parsed == null) {
        return "Tempo de colaboração inválido";
      }
    }

    if (tipoAtividade == TipoAtividade.BancoDeQuestoes) {
      for (int i = 0; i < assuntos.length; i++) {
        if (assuntos[i].text.isEmpty) {
          return "Tag de assunto vazia na atividade. Remova ou insira um valor";
        }
      }
    } else {
      if (notaReferencia.text.isEmpty) {
        return "Necessário preencher a nota referência";
      }
      double? parsed = tryParseDouble(notaReferencia.text);
      if (parsed == null) {
        return "Nota referência inválida";
      }
      if (questoes.isEmpty) {
        return "Necessário inserir uma questão";
      }
      for (int i = 0; i < questoes.length; i++) {
        String? erroQuestao = questoes[i].verificarErroCriacaoAtividade();
        if (erroQuestao != null) {
          return "Questão " + (i + 1).toString() + ". " + erroQuestao;
        }
      }
    }
    return null;
  }

  String? procurarErrosResponderAtividade() {
    if (tipoAtividade == TipoAtividade.BancoDeQuestoes) {
      if (questoes.isEmpty) {
        return "Necessário inserir uma questão";
      }
      for (int i = 0; i < questoes.length; i++) {
        String? erroQuestao = questoes[i].verificarErroRespostaBanco();
        if (erroQuestao != null) {
          return "Questão " + (i + 1).toString();
        }
      }
    } else if (tipoAtividade == TipoAtividade.Alternativa) {
      for (int i = 0; i < questoes.length; i++) {
        String? erroQuestao = questoes[i].verificarErroRespostaAlternativa();
        if (erroQuestao != null) {
          return "Questão " + (i + 1).toString();
        }
      }
    } else {
      for (int i = 0; i < questoes.length; i++) {
        String? erroQuestao = questoes[i].verificarErroRespostaDissertativa();
        if (erroQuestao != null) {
          return "Questão " + (i + 1).toString();
        }
      }
    }

    return null;
  }

  String? procurarErrosCorrecao() {
    if (tipoAtividade != TipoAtividade.Dissertativa) {
      return "Erro com o tipo de atividade";
    }
    for (int i = 0; i < questoes.length; i++) {
      if (questoes[i].notaCorrecao < 0 || questoes[i].notaCorrecao > 10) {
        return "Questão " + (i + 1).toString() + ". Nota inválida";
      }
      if (questoes[i].comentarioCorrecao.text.isEmpty) {
        return "Questão " +
            (i + 1).toString() +
            ". Necessário inserir um comentário";
      }
    }
    return null;
  }
}

class InformacoesQuestoes {
  late TextEditingController enunciado;
  late TextEditingController textoRespostaEsperada;
  late TextEditingController textoRespostaInserida;
  late String? imagemRespostaEsperada;
  late String? imagemRespostaInserida;
  late List<TextEditingController> alternativas;
  late int alternativaCorreta;
  late int alternativaSelecionada;
  late bool alternativa;
  late bool respostaImagem;

  late bool respostaEsperadaImagem;
  late bool corrigida;
  late TextEditingController comentarioCorrecao;
  late double notaCorrecao;
  late StatusRespostaDissertativa? statusRespostaDissertativa;

  InformacoesQuestoes.fromRespostaBancoDeQuestoes(
    RespostaAtividadeResposta resposta,
    bool avaliada,
  ) {
    enunciado = TextEditingController(text: resposta.enunciado);
    textoRespostaEsperada = TextEditingController();
    textoRespostaInserida = TextEditingController();
    imagemRespostaEsperada = null;
    imagemRespostaInserida = null;
    alternativas = resposta.alternativas!
        .map((e) => TextEditingController(text: e.item))
        .toList();
    alternativaCorreta =
        resposta.alternativas!.indexWhere((element) => element.value);
    alternativaSelecionada = -1;
    alternativa = true;
    respostaImagem = false;
    respostaEsperadaImagem = false;
    corrigida = avaliada;
  }

  InformacoesQuestoes.fromRespostaDissertativa(
      AtividadeItens questao,
      RespostaAtividadeResposta resposta,
      bool _corrigida,
      CorrecaoDissertativa? correcaoDissertativa) {
    enunciado = TextEditingController(text: questao.enunciado);
    textoRespostaEsperada =
        TextEditingController(text: questao.respostaEsperada?.texto);
    textoRespostaInserida =
        TextEditingController(text: resposta.resposta?.texto);
    imagemRespostaEsperada = questao.respostaEsperada?.imagem;
    imagemRespostaInserida = resposta.resposta?.imagem;
    alternativas = [];
    alternativaCorreta = -1;
    alternativaSelecionada = -1;
    alternativa = false;
    respostaEsperadaImagem = questao.respostaEsperada?.foto ?? false;
    respostaImagem = resposta.resposta?.foto ?? false;
    corrigida = _corrigida;
    comentarioCorrecao =
        TextEditingController(text: correcaoDissertativa?.comentarios);
    notaCorrecao = correcaoDissertativa?.nota ?? -1;
    statusRespostaDissertativa = correcaoDissertativa?.status;
  }

  InformacoesQuestoes.fromRespostaAlternativa(AtividadeItens questao,
      RespostaAtividadeResposta respostaQuestao, bool _corrigida) {
    enunciado = TextEditingController(text: questao.enunciado);
    textoRespostaInserida = TextEditingController();
    textoRespostaEsperada = TextEditingController();
    imagemRespostaInserida = null;
    imagemRespostaEsperada = null;
    alternativas = questao.alternativas != null
        ? questao.alternativas!
            .map((e) => TextEditingController(text: e.item))
            .toList()
        : [];
    alternativaCorreta = questao.alternativas != null
        ? questao.alternativas!.indexWhere((element) => element.value)
        : -1;
    alternativaSelecionada = respostaQuestao.alternativas != null
        ? respostaQuestao.alternativas!.indexWhere((element) => element.value)
        : -1;
    corrigida = _corrigida;
    comentarioCorrecao = TextEditingController();
    notaCorrecao = -1;
    statusRespostaDissertativa = null;
  }

  InformacoesQuestoes.fromQuestao(
    AtividadeItens questao,
    TipoAtividade tipoAtividade,
  ) {
    enunciado = TextEditingController(text: questao.enunciado);
    textoRespostaEsperada =
        TextEditingController(text: questao.respostaEsperada?.texto);
    textoRespostaInserida = TextEditingController();
    imagemRespostaEsperada = questao.respostaEsperada?.imagem;
    imagemRespostaInserida = null;
    alternativas = questao.alternativas != null
        ? questao.alternativas!
            .map((e) => TextEditingController(text: e.item))
            .toList()
        : [];
    alternativaCorreta = questao.alternativas != null
        ? questao.alternativas!.indexWhere((element) => element.value)
        : -1;
    alternativaSelecionada = -1;
    alternativa = tipoAtividade == TipoAtividade.Alternativa ? true : false;
    respostaImagem = false;
    corrigida = false;
    respostaEsperadaImagem = false;
    comentarioCorrecao = TextEditingController();
    notaCorrecao = -1;
    statusRespostaDissertativa = null;
  }

  InformacoesQuestoes.alternativa() {
    enunciado = TextEditingController();
    textoRespostaEsperada = TextEditingController();
    textoRespostaInserida = TextEditingController();
    imagemRespostaEsperada = null;
    imagemRespostaInserida = null;
    alternativas = [TextEditingController()];
    alternativaCorreta = -1;
    alternativaSelecionada = -1;
    alternativa = true;
    respostaImagem = false;
    corrigida = false;
    respostaEsperadaImagem = false;
    corrigida = false;
    respostaEsperadaImagem = false;
    comentarioCorrecao = TextEditingController();
    notaCorrecao = -1;
    statusRespostaDissertativa = null;
  }

  InformacoesQuestoes.dissertativa() {
    enunciado = TextEditingController();
    textoRespostaEsperada = TextEditingController();
    textoRespostaInserida = TextEditingController();
    imagemRespostaEsperada = null;
    imagemRespostaInserida = null;
    alternativas = [TextEditingController()];
    alternativaCorreta = -1;
    alternativaSelecionada = -1;
    alternativa = false;
    respostaImagem = false;
    corrigida = false;
    respostaEsperadaImagem = false;
    corrigida = false;
    respostaEsperadaImagem = false;
    comentarioCorrecao = TextEditingController();
    notaCorrecao = -1;
    statusRespostaDissertativa = null;
  }

  String? verificarErroCriacaoAtividade() {
    if (enunciado.text.isEmpty) {
      return "Necessário inserir o enunciado";
    }
    if (alternativa) {
      if (alternativas.length < 4) {
        return "Necessário ao menos 4 alternativas na questão";
      }
      if (alternativaCorreta == -1 ||
          alternativaCorreta >= alternativas.length) {
        return "Necessário selecionar uma alternativa válida";
      }
    } else {
      if (respostaImagem) {
        if (imagemRespostaEsperada == null) {
          return "Necessário inserir a imagem da resposta esperada";
        }
      } else {
        if (textoRespostaEsperada.text.isEmpty) {
          return "Necessário inserir o texto da resposta esperada";
        }
      }
    }
    return null;
  }

  String? verificarErroRespostaBanco() {
    if (enunciado.text.isEmpty) {
      return "Necessário inserir um enunciado";
    }
    if (!alternativa) {
      return "Erro inesperado, essa pergunta deveria ser alternativa";
    }
    if (alternativaCorreta == -1 || alternativaCorreta >= alternativas.length) {
      return "Necessário selecionar uma alternativa válida";
    }
    return null;
  }

  String? verificarErroRespostaAlternativa() {
    if (alternativaSelecionada == -1 ||
        alternativaSelecionada >= alternativas.length) {
      return "Selecione uma alternativa válida";
    }
  }

  String? verificarErroRespostaDissertativa() {
    if (respostaImagem) {
      if (imagemRespostaInserida == null) {
        return "Necesário inserir a imagem da sua resposta";
      }
    } else {
      if (textoRespostaInserida.text.isEmpty) {
        return "Necessário preencher sua resposta";
      }
    }
    return null;
  }
}

double? tryParseDouble(String text) {
  return double.tryParse(text.replaceAll(",", "."));
}
