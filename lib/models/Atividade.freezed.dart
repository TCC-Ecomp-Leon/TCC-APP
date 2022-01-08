// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Atividade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestaoAlternativa _$QuestaoAlternativaFromJson(Map<String, dynamic> json) {
  return _QuestaoAlternativa.fromJson(json);
}

/// @nodoc
class _$QuestaoAlternativaTearOff {
  const _$QuestaoAlternativaTearOff();

  _QuestaoAlternativa call(String idQuestao, String enunciado, int peso,
      List<QuestaoAlternativaAlternativa> alternativas) {
    return _QuestaoAlternativa(
      idQuestao,
      enunciado,
      peso,
      alternativas,
    );
  }

  QuestaoAlternativa fromJson(Map<String, Object?> json) {
    return QuestaoAlternativa.fromJson(json);
  }
}

/// @nodoc
const $QuestaoAlternativa = _$QuestaoAlternativaTearOff();

/// @nodoc
mixin _$QuestaoAlternativa {
  String get idQuestao => throw _privateConstructorUsedError;
  String get enunciado => throw _privateConstructorUsedError;
  int get peso => throw _privateConstructorUsedError;
  List<QuestaoAlternativaAlternativa> get alternativas =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestaoAlternativaCopyWith<QuestaoAlternativa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestaoAlternativaCopyWith<$Res> {
  factory $QuestaoAlternativaCopyWith(
          QuestaoAlternativa value, $Res Function(QuestaoAlternativa) then) =
      _$QuestaoAlternativaCopyWithImpl<$Res>;
  $Res call(
      {String idQuestao,
      String enunciado,
      int peso,
      List<QuestaoAlternativaAlternativa> alternativas});
}

/// @nodoc
class _$QuestaoAlternativaCopyWithImpl<$Res>
    implements $QuestaoAlternativaCopyWith<$Res> {
  _$QuestaoAlternativaCopyWithImpl(this._value, this._then);

  final QuestaoAlternativa _value;
  // ignore: unused_field
  final $Res Function(QuestaoAlternativa) _then;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? alternativas = freezed,
  }) {
    return _then(_value.copyWith(
      idQuestao: idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado: enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso: peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as int,
      alternativas: alternativas == freezed
          ? _value.alternativas
          : alternativas // ignore: cast_nullable_to_non_nullable
              as List<QuestaoAlternativaAlternativa>,
    ));
  }
}

/// @nodoc
abstract class _$QuestaoAlternativaCopyWith<$Res>
    implements $QuestaoAlternativaCopyWith<$Res> {
  factory _$QuestaoAlternativaCopyWith(
          _QuestaoAlternativa value, $Res Function(_QuestaoAlternativa) then) =
      __$QuestaoAlternativaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idQuestao,
      String enunciado,
      int peso,
      List<QuestaoAlternativaAlternativa> alternativas});
}

/// @nodoc
class __$QuestaoAlternativaCopyWithImpl<$Res>
    extends _$QuestaoAlternativaCopyWithImpl<$Res>
    implements _$QuestaoAlternativaCopyWith<$Res> {
  __$QuestaoAlternativaCopyWithImpl(
      _QuestaoAlternativa _value, $Res Function(_QuestaoAlternativa) _then)
      : super(_value, (v) => _then(v as _QuestaoAlternativa));

  @override
  _QuestaoAlternativa get _value => super._value as _QuestaoAlternativa;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? alternativas = freezed,
  }) {
    return _then(_QuestaoAlternativa(
      idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as int,
      alternativas == freezed
          ? _value.alternativas
          : alternativas // ignore: cast_nullable_to_non_nullable
              as List<QuestaoAlternativaAlternativa>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestaoAlternativa implements _QuestaoAlternativa {
  const _$_QuestaoAlternativa(
      this.idQuestao, this.enunciado, this.peso, this.alternativas);

  factory _$_QuestaoAlternativa.fromJson(Map<String, dynamic> json) =>
      _$$_QuestaoAlternativaFromJson(json);

  @override
  final String idQuestao;
  @override
  final String enunciado;
  @override
  final int peso;
  @override
  final List<QuestaoAlternativaAlternativa> alternativas;

  @override
  String toString() {
    return 'QuestaoAlternativa(idQuestao: $idQuestao, enunciado: $enunciado, peso: $peso, alternativas: $alternativas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestaoAlternativa &&
            const DeepCollectionEquality().equals(other.idQuestao, idQuestao) &&
            const DeepCollectionEquality().equals(other.enunciado, enunciado) &&
            const DeepCollectionEquality().equals(other.peso, peso) &&
            const DeepCollectionEquality()
                .equals(other.alternativas, alternativas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idQuestao),
      const DeepCollectionEquality().hash(enunciado),
      const DeepCollectionEquality().hash(peso),
      const DeepCollectionEquality().hash(alternativas));

  @JsonKey(ignore: true)
  @override
  _$QuestaoAlternativaCopyWith<_QuestaoAlternativa> get copyWith =>
      __$QuestaoAlternativaCopyWithImpl<_QuestaoAlternativa>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestaoAlternativaToJson(this);
  }
}

abstract class _QuestaoAlternativa implements QuestaoAlternativa {
  const factory _QuestaoAlternativa(
      String idQuestao,
      String enunciado,
      int peso,
      List<QuestaoAlternativaAlternativa> alternativas) = _$_QuestaoAlternativa;

  factory _QuestaoAlternativa.fromJson(Map<String, dynamic> json) =
      _$_QuestaoAlternativa.fromJson;

  @override
  String get idQuestao;
  @override
  String get enunciado;
  @override
  int get peso;
  @override
  List<QuestaoAlternativaAlternativa> get alternativas;
  @override
  @JsonKey(ignore: true)
  _$QuestaoAlternativaCopyWith<_QuestaoAlternativa> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestaoAlternativaAlternativa _$QuestaoAlternativaAlternativaFromJson(
    Map<String, dynamic> json) {
  return _QuestaoAlternativaAlternativa.fromJson(json);
}

/// @nodoc
class _$QuestaoAlternativaAlternativaTearOff {
  const _$QuestaoAlternativaAlternativaTearOff();

  _QuestaoAlternativaAlternativa call(String item, bool value) {
    return _QuestaoAlternativaAlternativa(
      item,
      value,
    );
  }

  QuestaoAlternativaAlternativa fromJson(Map<String, Object?> json) {
    return QuestaoAlternativaAlternativa.fromJson(json);
  }
}

/// @nodoc
const $QuestaoAlternativaAlternativa = _$QuestaoAlternativaAlternativaTearOff();

/// @nodoc
mixin _$QuestaoAlternativaAlternativa {
  String get item => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestaoAlternativaAlternativaCopyWith<QuestaoAlternativaAlternativa>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestaoAlternativaAlternativaCopyWith<$Res> {
  factory $QuestaoAlternativaAlternativaCopyWith(
          QuestaoAlternativaAlternativa value,
          $Res Function(QuestaoAlternativaAlternativa) then) =
      _$QuestaoAlternativaAlternativaCopyWithImpl<$Res>;
  $Res call({String item, bool value});
}

/// @nodoc
class _$QuestaoAlternativaAlternativaCopyWithImpl<$Res>
    implements $QuestaoAlternativaAlternativaCopyWith<$Res> {
  _$QuestaoAlternativaAlternativaCopyWithImpl(this._value, this._then);

  final QuestaoAlternativaAlternativa _value;
  // ignore: unused_field
  final $Res Function(QuestaoAlternativaAlternativa) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$QuestaoAlternativaAlternativaCopyWith<$Res>
    implements $QuestaoAlternativaAlternativaCopyWith<$Res> {
  factory _$QuestaoAlternativaAlternativaCopyWith(
          _QuestaoAlternativaAlternativa value,
          $Res Function(_QuestaoAlternativaAlternativa) then) =
      __$QuestaoAlternativaAlternativaCopyWithImpl<$Res>;
  @override
  $Res call({String item, bool value});
}

/// @nodoc
class __$QuestaoAlternativaAlternativaCopyWithImpl<$Res>
    extends _$QuestaoAlternativaAlternativaCopyWithImpl<$Res>
    implements _$QuestaoAlternativaAlternativaCopyWith<$Res> {
  __$QuestaoAlternativaAlternativaCopyWithImpl(
      _QuestaoAlternativaAlternativa _value,
      $Res Function(_QuestaoAlternativaAlternativa) _then)
      : super(_value, (v) => _then(v as _QuestaoAlternativaAlternativa));

  @override
  _QuestaoAlternativaAlternativa get _value =>
      super._value as _QuestaoAlternativaAlternativa;

  @override
  $Res call({
    Object? item = freezed,
    Object? value = freezed,
  }) {
    return _then(_QuestaoAlternativaAlternativa(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestaoAlternativaAlternativa
    implements _QuestaoAlternativaAlternativa {
  const _$_QuestaoAlternativaAlternativa(this.item, this.value);

  factory _$_QuestaoAlternativaAlternativa.fromJson(
          Map<String, dynamic> json) =>
      _$$_QuestaoAlternativaAlternativaFromJson(json);

  @override
  final String item;
  @override
  final bool value;

  @override
  String toString() {
    return 'QuestaoAlternativaAlternativa(item: $item, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestaoAlternativaAlternativa &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$QuestaoAlternativaAlternativaCopyWith<_QuestaoAlternativaAlternativa>
      get copyWith => __$QuestaoAlternativaAlternativaCopyWithImpl<
          _QuestaoAlternativaAlternativa>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestaoAlternativaAlternativaToJson(this);
  }
}

abstract class _QuestaoAlternativaAlternativa
    implements QuestaoAlternativaAlternativa {
  const factory _QuestaoAlternativaAlternativa(String item, bool value) =
      _$_QuestaoAlternativaAlternativa;

  factory _QuestaoAlternativaAlternativa.fromJson(Map<String, dynamic> json) =
      _$_QuestaoAlternativaAlternativa.fromJson;

  @override
  String get item;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$QuestaoAlternativaAlternativaCopyWith<_QuestaoAlternativaAlternativa>
      get copyWith => throw _privateConstructorUsedError;
}

QuestaoDissertativa _$QuestaoDissertativaFromJson(Map<String, dynamic> json) {
  return _QuestaoDissertativa.fromJson(json);
}

/// @nodoc
class _$QuestaoDissertativaTearOff {
  const _$QuestaoDissertativaTearOff();

  _QuestaoDissertativa call(String idQuestao, String enunciado, int peso,
      QuestaoDissertativaRespostaEsperada respostaEsperada) {
    return _QuestaoDissertativa(
      idQuestao,
      enunciado,
      peso,
      respostaEsperada,
    );
  }

  QuestaoDissertativa fromJson(Map<String, Object?> json) {
    return QuestaoDissertativa.fromJson(json);
  }
}

/// @nodoc
const $QuestaoDissertativa = _$QuestaoDissertativaTearOff();

/// @nodoc
mixin _$QuestaoDissertativa {
  String get idQuestao => throw _privateConstructorUsedError;
  String get enunciado => throw _privateConstructorUsedError;
  int get peso => throw _privateConstructorUsedError;
  QuestaoDissertativaRespostaEsperada get respostaEsperada =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestaoDissertativaCopyWith<QuestaoDissertativa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestaoDissertativaCopyWith<$Res> {
  factory $QuestaoDissertativaCopyWith(
          QuestaoDissertativa value, $Res Function(QuestaoDissertativa) then) =
      _$QuestaoDissertativaCopyWithImpl<$Res>;
  $Res call(
      {String idQuestao,
      String enunciado,
      int peso,
      QuestaoDissertativaRespostaEsperada respostaEsperada});

  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> get respostaEsperada;
}

/// @nodoc
class _$QuestaoDissertativaCopyWithImpl<$Res>
    implements $QuestaoDissertativaCopyWith<$Res> {
  _$QuestaoDissertativaCopyWithImpl(this._value, this._then);

  final QuestaoDissertativa _value;
  // ignore: unused_field
  final $Res Function(QuestaoDissertativa) _then;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? respostaEsperada = freezed,
  }) {
    return _then(_value.copyWith(
      idQuestao: idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado: enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso: peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as int,
      respostaEsperada: respostaEsperada == freezed
          ? _value.respostaEsperada
          : respostaEsperada // ignore: cast_nullable_to_non_nullable
              as QuestaoDissertativaRespostaEsperada,
    ));
  }

  @override
  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> get respostaEsperada {
    return $QuestaoDissertativaRespostaEsperadaCopyWith<$Res>(
        _value.respostaEsperada, (value) {
      return _then(_value.copyWith(respostaEsperada: value));
    });
  }
}

/// @nodoc
abstract class _$QuestaoDissertativaCopyWith<$Res>
    implements $QuestaoDissertativaCopyWith<$Res> {
  factory _$QuestaoDissertativaCopyWith(_QuestaoDissertativa value,
          $Res Function(_QuestaoDissertativa) then) =
      __$QuestaoDissertativaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idQuestao,
      String enunciado,
      int peso,
      QuestaoDissertativaRespostaEsperada respostaEsperada});

  @override
  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> get respostaEsperada;
}

/// @nodoc
class __$QuestaoDissertativaCopyWithImpl<$Res>
    extends _$QuestaoDissertativaCopyWithImpl<$Res>
    implements _$QuestaoDissertativaCopyWith<$Res> {
  __$QuestaoDissertativaCopyWithImpl(
      _QuestaoDissertativa _value, $Res Function(_QuestaoDissertativa) _then)
      : super(_value, (v) => _then(v as _QuestaoDissertativa));

  @override
  _QuestaoDissertativa get _value => super._value as _QuestaoDissertativa;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? respostaEsperada = freezed,
  }) {
    return _then(_QuestaoDissertativa(
      idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as int,
      respostaEsperada == freezed
          ? _value.respostaEsperada
          : respostaEsperada // ignore: cast_nullable_to_non_nullable
              as QuestaoDissertativaRespostaEsperada,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestaoDissertativa implements _QuestaoDissertativa {
  const _$_QuestaoDissertativa(
      this.idQuestao, this.enunciado, this.peso, this.respostaEsperada);

  factory _$_QuestaoDissertativa.fromJson(Map<String, dynamic> json) =>
      _$$_QuestaoDissertativaFromJson(json);

  @override
  final String idQuestao;
  @override
  final String enunciado;
  @override
  final int peso;
  @override
  final QuestaoDissertativaRespostaEsperada respostaEsperada;

  @override
  String toString() {
    return 'QuestaoDissertativa(idQuestao: $idQuestao, enunciado: $enunciado, peso: $peso, respostaEsperada: $respostaEsperada)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestaoDissertativa &&
            const DeepCollectionEquality().equals(other.idQuestao, idQuestao) &&
            const DeepCollectionEquality().equals(other.enunciado, enunciado) &&
            const DeepCollectionEquality().equals(other.peso, peso) &&
            const DeepCollectionEquality()
                .equals(other.respostaEsperada, respostaEsperada));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idQuestao),
      const DeepCollectionEquality().hash(enunciado),
      const DeepCollectionEquality().hash(peso),
      const DeepCollectionEquality().hash(respostaEsperada));

  @JsonKey(ignore: true)
  @override
  _$QuestaoDissertativaCopyWith<_QuestaoDissertativa> get copyWith =>
      __$QuestaoDissertativaCopyWithImpl<_QuestaoDissertativa>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestaoDissertativaToJson(this);
  }
}

abstract class _QuestaoDissertativa implements QuestaoDissertativa {
  const factory _QuestaoDissertativa(String idQuestao, String enunciado,
          int peso, QuestaoDissertativaRespostaEsperada respostaEsperada) =
      _$_QuestaoDissertativa;

  factory _QuestaoDissertativa.fromJson(Map<String, dynamic> json) =
      _$_QuestaoDissertativa.fromJson;

  @override
  String get idQuestao;
  @override
  String get enunciado;
  @override
  int get peso;
  @override
  QuestaoDissertativaRespostaEsperada get respostaEsperada;
  @override
  @JsonKey(ignore: true)
  _$QuestaoDissertativaCopyWith<_QuestaoDissertativa> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestaoDissertativaRespostaEsperada
    _$QuestaoDissertativaRespostaEsperadaFromJson(Map<String, dynamic> json) {
  return _QuestaoDissertativaRespostaEsperada.fromJson(json);
}

/// @nodoc
class _$QuestaoDissertativaRespostaEsperadaTearOff {
  const _$QuestaoDissertativaRespostaEsperadaTearOff();

  _QuestaoDissertativaRespostaEsperada call(
      bool foto, String? texto, String? imagem) {
    return _QuestaoDissertativaRespostaEsperada(
      foto,
      texto,
      imagem,
    );
  }

  QuestaoDissertativaRespostaEsperada fromJson(Map<String, Object?> json) {
    return QuestaoDissertativaRespostaEsperada.fromJson(json);
  }
}

/// @nodoc
const $QuestaoDissertativaRespostaEsperada =
    _$QuestaoDissertativaRespostaEsperadaTearOff();

/// @nodoc
mixin _$QuestaoDissertativaRespostaEsperada {
  bool get foto => throw _privateConstructorUsedError;
  String? get texto => throw _privateConstructorUsedError;
  String? get imagem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestaoDissertativaRespostaEsperadaCopyWith<
          QuestaoDissertativaRespostaEsperada>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> {
  factory $QuestaoDissertativaRespostaEsperadaCopyWith(
          QuestaoDissertativaRespostaEsperada value,
          $Res Function(QuestaoDissertativaRespostaEsperada) then) =
      _$QuestaoDissertativaRespostaEsperadaCopyWithImpl<$Res>;
  $Res call({bool foto, String? texto, String? imagem});
}

/// @nodoc
class _$QuestaoDissertativaRespostaEsperadaCopyWithImpl<$Res>
    implements $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> {
  _$QuestaoDissertativaRespostaEsperadaCopyWithImpl(this._value, this._then);

  final QuestaoDissertativaRespostaEsperada _value;
  // ignore: unused_field
  final $Res Function(QuestaoDissertativaRespostaEsperada) _then;

  @override
  $Res call({
    Object? foto = freezed,
    Object? texto = freezed,
    Object? imagem = freezed,
  }) {
    return _then(_value.copyWith(
      foto: foto == freezed
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as bool,
      texto: texto == freezed
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String?,
      imagem: imagem == freezed
          ? _value.imagem
          : imagem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuestaoDissertativaRespostaEsperadaCopyWith<$Res>
    implements $QuestaoDissertativaRespostaEsperadaCopyWith<$Res> {
  factory _$QuestaoDissertativaRespostaEsperadaCopyWith(
          _QuestaoDissertativaRespostaEsperada value,
          $Res Function(_QuestaoDissertativaRespostaEsperada) then) =
      __$QuestaoDissertativaRespostaEsperadaCopyWithImpl<$Res>;
  @override
  $Res call({bool foto, String? texto, String? imagem});
}

/// @nodoc
class __$QuestaoDissertativaRespostaEsperadaCopyWithImpl<$Res>
    extends _$QuestaoDissertativaRespostaEsperadaCopyWithImpl<$Res>
    implements _$QuestaoDissertativaRespostaEsperadaCopyWith<$Res> {
  __$QuestaoDissertativaRespostaEsperadaCopyWithImpl(
      _QuestaoDissertativaRespostaEsperada _value,
      $Res Function(_QuestaoDissertativaRespostaEsperada) _then)
      : super(_value, (v) => _then(v as _QuestaoDissertativaRespostaEsperada));

  @override
  _QuestaoDissertativaRespostaEsperada get _value =>
      super._value as _QuestaoDissertativaRespostaEsperada;

  @override
  $Res call({
    Object? foto = freezed,
    Object? texto = freezed,
    Object? imagem = freezed,
  }) {
    return _then(_QuestaoDissertativaRespostaEsperada(
      foto == freezed
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as bool,
      texto == freezed
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String?,
      imagem == freezed
          ? _value.imagem
          : imagem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestaoDissertativaRespostaEsperada
    implements _QuestaoDissertativaRespostaEsperada {
  const _$_QuestaoDissertativaRespostaEsperada(
      this.foto, this.texto, this.imagem);

  factory _$_QuestaoDissertativaRespostaEsperada.fromJson(
          Map<String, dynamic> json) =>
      _$$_QuestaoDissertativaRespostaEsperadaFromJson(json);

  @override
  final bool foto;
  @override
  final String? texto;
  @override
  final String? imagem;

  @override
  String toString() {
    return 'QuestaoDissertativaRespostaEsperada(foto: $foto, texto: $texto, imagem: $imagem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestaoDissertativaRespostaEsperada &&
            const DeepCollectionEquality().equals(other.foto, foto) &&
            const DeepCollectionEquality().equals(other.texto, texto) &&
            const DeepCollectionEquality().equals(other.imagem, imagem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(foto),
      const DeepCollectionEquality().hash(texto),
      const DeepCollectionEquality().hash(imagem));

  @JsonKey(ignore: true)
  @override
  _$QuestaoDissertativaRespostaEsperadaCopyWith<
          _QuestaoDissertativaRespostaEsperada>
      get copyWith => __$QuestaoDissertativaRespostaEsperadaCopyWithImpl<
          _QuestaoDissertativaRespostaEsperada>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestaoDissertativaRespostaEsperadaToJson(this);
  }
}

abstract class _QuestaoDissertativaRespostaEsperada
    implements QuestaoDissertativaRespostaEsperada {
  const factory _QuestaoDissertativaRespostaEsperada(
          bool foto, String? texto, String? imagem) =
      _$_QuestaoDissertativaRespostaEsperada;

  factory _QuestaoDissertativaRespostaEsperada.fromJson(
          Map<String, dynamic> json) =
      _$_QuestaoDissertativaRespostaEsperada.fromJson;

  @override
  bool get foto;
  @override
  String? get texto;
  @override
  String? get imagem;
  @override
  @JsonKey(ignore: true)
  _$QuestaoDissertativaRespostaEsperadaCopyWith<
          _QuestaoDissertativaRespostaEsperada>
      get copyWith => throw _privateConstructorUsedError;
}

Atividade _$AtividadeFromJson(Map<String, dynamic> json) {
  return _Atividade.fromJson(json);
}

/// @nodoc
class _$AtividadeTearOff {
  const _$AtividadeTearOff();

  _Atividade call(
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
      DateTime? fechamentoCorrecoes) {
    return _Atividade(
      id,
      nome,
      criadoEm,
      idProjeto,
      idCurso,
      idMateria,
      tipoAtividade,
      aberturaRespostas,
      fechamentoRespostas,
      assuntos,
      tempoColaboracao,
      notaReferencia,
      itens,
      fechamentoCorrecoes,
    );
  }

  Atividade fromJson(Map<String, Object?> json) {
    return Atividade.fromJson(json);
  }
}

/// @nodoc
const $Atividade = _$AtividadeTearOff();

/// @nodoc
mixin _$Atividade {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  DateTime get criadoEm => throw _privateConstructorUsedError;
  String get idProjeto => throw _privateConstructorUsedError;
  String get idCurso => throw _privateConstructorUsedError;
  String? get idMateria => throw _privateConstructorUsedError;
  TipoAtividade get tipoAtividade => throw _privateConstructorUsedError;
  DateTime get aberturaRespostas => throw _privateConstructorUsedError;
  DateTime get fechamentoRespostas => throw _privateConstructorUsedError;
  List<String>? get assuntos => throw _privateConstructorUsedError;
  double? get tempoColaboracao => throw _privateConstructorUsedError;
  double? get notaReferencia => throw _privateConstructorUsedError;
  List<AtividadeItens>? get itens => throw _privateConstructorUsedError;
  DateTime? get fechamentoCorrecoes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtividadeCopyWith<Atividade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtividadeCopyWith<$Res> {
  factory $AtividadeCopyWith(Atividade value, $Res Function(Atividade) then) =
      _$AtividadeCopyWithImpl<$Res>;
  $Res call(
      {String id,
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
      DateTime? fechamentoCorrecoes});
}

/// @nodoc
class _$AtividadeCopyWithImpl<$Res> implements $AtividadeCopyWith<$Res> {
  _$AtividadeCopyWithImpl(this._value, this._then);

  final Atividade _value;
  // ignore: unused_field
  final $Res Function(Atividade) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? criadoEm = freezed,
    Object? idProjeto = freezed,
    Object? idCurso = freezed,
    Object? idMateria = freezed,
    Object? tipoAtividade = freezed,
    Object? aberturaRespostas = freezed,
    Object? fechamentoRespostas = freezed,
    Object? assuntos = freezed,
    Object? tempoColaboracao = freezed,
    Object? notaReferencia = freezed,
    Object? itens = freezed,
    Object? fechamentoCorrecoes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      criadoEm: criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      idProjeto: idProjeto == freezed
          ? _value.idProjeto
          : idProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      idCurso: idCurso == freezed
          ? _value.idCurso
          : idCurso // ignore: cast_nullable_to_non_nullable
              as String,
      idMateria: idMateria == freezed
          ? _value.idMateria
          : idMateria // ignore: cast_nullable_to_non_nullable
              as String?,
      tipoAtividade: tipoAtividade == freezed
          ? _value.tipoAtividade
          : tipoAtividade // ignore: cast_nullable_to_non_nullable
              as TipoAtividade,
      aberturaRespostas: aberturaRespostas == freezed
          ? _value.aberturaRespostas
          : aberturaRespostas // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechamentoRespostas: fechamentoRespostas == freezed
          ? _value.fechamentoRespostas
          : fechamentoRespostas // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assuntos: assuntos == freezed
          ? _value.assuntos
          : assuntos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tempoColaboracao: tempoColaboracao == freezed
          ? _value.tempoColaboracao
          : tempoColaboracao // ignore: cast_nullable_to_non_nullable
              as double?,
      notaReferencia: notaReferencia == freezed
          ? _value.notaReferencia
          : notaReferencia // ignore: cast_nullable_to_non_nullable
              as double?,
      itens: itens == freezed
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<AtividadeItens>?,
      fechamentoCorrecoes: fechamentoCorrecoes == freezed
          ? _value.fechamentoCorrecoes
          : fechamentoCorrecoes // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$AtividadeCopyWith<$Res> implements $AtividadeCopyWith<$Res> {
  factory _$AtividadeCopyWith(
          _Atividade value, $Res Function(_Atividade) then) =
      __$AtividadeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
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
      DateTime? fechamentoCorrecoes});
}

/// @nodoc
class __$AtividadeCopyWithImpl<$Res> extends _$AtividadeCopyWithImpl<$Res>
    implements _$AtividadeCopyWith<$Res> {
  __$AtividadeCopyWithImpl(_Atividade _value, $Res Function(_Atividade) _then)
      : super(_value, (v) => _then(v as _Atividade));

  @override
  _Atividade get _value => super._value as _Atividade;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? criadoEm = freezed,
    Object? idProjeto = freezed,
    Object? idCurso = freezed,
    Object? idMateria = freezed,
    Object? tipoAtividade = freezed,
    Object? aberturaRespostas = freezed,
    Object? fechamentoRespostas = freezed,
    Object? assuntos = freezed,
    Object? tempoColaboracao = freezed,
    Object? notaReferencia = freezed,
    Object? itens = freezed,
    Object? fechamentoCorrecoes = freezed,
  }) {
    return _then(_Atividade(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      criadoEm == freezed
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      idProjeto == freezed
          ? _value.idProjeto
          : idProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      idCurso == freezed
          ? _value.idCurso
          : idCurso // ignore: cast_nullable_to_non_nullable
              as String,
      idMateria == freezed
          ? _value.idMateria
          : idMateria // ignore: cast_nullable_to_non_nullable
              as String?,
      tipoAtividade == freezed
          ? _value.tipoAtividade
          : tipoAtividade // ignore: cast_nullable_to_non_nullable
              as TipoAtividade,
      aberturaRespostas == freezed
          ? _value.aberturaRespostas
          : aberturaRespostas // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechamentoRespostas == freezed
          ? _value.fechamentoRespostas
          : fechamentoRespostas // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assuntos == freezed
          ? _value.assuntos
          : assuntos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tempoColaboracao == freezed
          ? _value.tempoColaboracao
          : tempoColaboracao // ignore: cast_nullable_to_non_nullable
              as double?,
      notaReferencia == freezed
          ? _value.notaReferencia
          : notaReferencia // ignore: cast_nullable_to_non_nullable
              as double?,
      itens == freezed
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<AtividadeItens>?,
      fechamentoCorrecoes == freezed
          ? _value.fechamentoCorrecoes
          : fechamentoCorrecoes // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Atividade implements _Atividade {
  const _$_Atividade(
      this.id,
      this.nome,
      this.criadoEm,
      this.idProjeto,
      this.idCurso,
      this.idMateria,
      this.tipoAtividade,
      this.aberturaRespostas,
      this.fechamentoRespostas,
      this.assuntos,
      this.tempoColaboracao,
      this.notaReferencia,
      this.itens,
      this.fechamentoCorrecoes);

  factory _$_Atividade.fromJson(Map<String, dynamic> json) =>
      _$$_AtividadeFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final DateTime criadoEm;
  @override
  final String idProjeto;
  @override
  final String idCurso;
  @override
  final String? idMateria;
  @override
  final TipoAtividade tipoAtividade;
  @override
  final DateTime aberturaRespostas;
  @override
  final DateTime fechamentoRespostas;
  @override
  final List<String>? assuntos;
  @override
  final double? tempoColaboracao;
  @override
  final double? notaReferencia;
  @override
  final List<AtividadeItens>? itens;
  @override
  final DateTime? fechamentoCorrecoes;

  @override
  String toString() {
    return 'Atividade(id: $id, nome: $nome, criadoEm: $criadoEm, idProjeto: $idProjeto, idCurso: $idCurso, idMateria: $idMateria, tipoAtividade: $tipoAtividade, aberturaRespostas: $aberturaRespostas, fechamentoRespostas: $fechamentoRespostas, assuntos: $assuntos, tempoColaboracao: $tempoColaboracao, notaReferencia: $notaReferencia, itens: $itens, fechamentoCorrecoes: $fechamentoCorrecoes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Atividade &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.criadoEm, criadoEm) &&
            const DeepCollectionEquality().equals(other.idProjeto, idProjeto) &&
            const DeepCollectionEquality().equals(other.idCurso, idCurso) &&
            const DeepCollectionEquality().equals(other.idMateria, idMateria) &&
            const DeepCollectionEquality()
                .equals(other.tipoAtividade, tipoAtividade) &&
            const DeepCollectionEquality()
                .equals(other.aberturaRespostas, aberturaRespostas) &&
            const DeepCollectionEquality()
                .equals(other.fechamentoRespostas, fechamentoRespostas) &&
            const DeepCollectionEquality().equals(other.assuntos, assuntos) &&
            const DeepCollectionEquality()
                .equals(other.tempoColaboracao, tempoColaboracao) &&
            const DeepCollectionEquality()
                .equals(other.notaReferencia, notaReferencia) &&
            const DeepCollectionEquality().equals(other.itens, itens) &&
            const DeepCollectionEquality()
                .equals(other.fechamentoCorrecoes, fechamentoCorrecoes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(criadoEm),
      const DeepCollectionEquality().hash(idProjeto),
      const DeepCollectionEquality().hash(idCurso),
      const DeepCollectionEquality().hash(idMateria),
      const DeepCollectionEquality().hash(tipoAtividade),
      const DeepCollectionEquality().hash(aberturaRespostas),
      const DeepCollectionEquality().hash(fechamentoRespostas),
      const DeepCollectionEquality().hash(assuntos),
      const DeepCollectionEquality().hash(tempoColaboracao),
      const DeepCollectionEquality().hash(notaReferencia),
      const DeepCollectionEquality().hash(itens),
      const DeepCollectionEquality().hash(fechamentoCorrecoes));

  @JsonKey(ignore: true)
  @override
  _$AtividadeCopyWith<_Atividade> get copyWith =>
      __$AtividadeCopyWithImpl<_Atividade>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AtividadeToJson(this);
  }
}

abstract class _Atividade implements Atividade {
  const factory _Atividade(
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
      DateTime? fechamentoCorrecoes) = _$_Atividade;

  factory _Atividade.fromJson(Map<String, dynamic> json) =
      _$_Atividade.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  DateTime get criadoEm;
  @override
  String get idProjeto;
  @override
  String get idCurso;
  @override
  String? get idMateria;
  @override
  TipoAtividade get tipoAtividade;
  @override
  DateTime get aberturaRespostas;
  @override
  DateTime get fechamentoRespostas;
  @override
  List<String>? get assuntos;
  @override
  double? get tempoColaboracao;
  @override
  double? get notaReferencia;
  @override
  List<AtividadeItens>? get itens;
  @override
  DateTime? get fechamentoCorrecoes;
  @override
  @JsonKey(ignore: true)
  _$AtividadeCopyWith<_Atividade> get copyWith =>
      throw _privateConstructorUsedError;
}

AtividadeItens _$AtividadeItensFromJson(Map<String, dynamic> json) {
  return _AtividadeItens.fromJson(json);
}

/// @nodoc
class _$AtividadeItensTearOff {
  const _$AtividadeItensTearOff();

  _AtividadeItens call(
      String idQuestao,
      String enunciado,
      double peso,
      List<QuestaoAlternativaAlternativa>? alternativas,
      QuestaoDissertativaRespostaEsperada? respostaEsperada) {
    return _AtividadeItens(
      idQuestao,
      enunciado,
      peso,
      alternativas,
      respostaEsperada,
    );
  }

  AtividadeItens fromJson(Map<String, Object?> json) {
    return AtividadeItens.fromJson(json);
  }
}

/// @nodoc
const $AtividadeItens = _$AtividadeItensTearOff();

/// @nodoc
mixin _$AtividadeItens {
  String get idQuestao => throw _privateConstructorUsedError;
  String get enunciado => throw _privateConstructorUsedError;
  double get peso => throw _privateConstructorUsedError;
  List<QuestaoAlternativaAlternativa>? get alternativas =>
      throw _privateConstructorUsedError;
  QuestaoDissertativaRespostaEsperada? get respostaEsperada =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtividadeItensCopyWith<AtividadeItens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtividadeItensCopyWith<$Res> {
  factory $AtividadeItensCopyWith(
          AtividadeItens value, $Res Function(AtividadeItens) then) =
      _$AtividadeItensCopyWithImpl<$Res>;
  $Res call(
      {String idQuestao,
      String enunciado,
      double peso,
      List<QuestaoAlternativaAlternativa>? alternativas,
      QuestaoDissertativaRespostaEsperada? respostaEsperada});

  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res>? get respostaEsperada;
}

/// @nodoc
class _$AtividadeItensCopyWithImpl<$Res>
    implements $AtividadeItensCopyWith<$Res> {
  _$AtividadeItensCopyWithImpl(this._value, this._then);

  final AtividadeItens _value;
  // ignore: unused_field
  final $Res Function(AtividadeItens) _then;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? alternativas = freezed,
    Object? respostaEsperada = freezed,
  }) {
    return _then(_value.copyWith(
      idQuestao: idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado: enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso: peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      alternativas: alternativas == freezed
          ? _value.alternativas
          : alternativas // ignore: cast_nullable_to_non_nullable
              as List<QuestaoAlternativaAlternativa>?,
      respostaEsperada: respostaEsperada == freezed
          ? _value.respostaEsperada
          : respostaEsperada // ignore: cast_nullable_to_non_nullable
              as QuestaoDissertativaRespostaEsperada?,
    ));
  }

  @override
  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res>? get respostaEsperada {
    if (_value.respostaEsperada == null) {
      return null;
    }

    return $QuestaoDissertativaRespostaEsperadaCopyWith<$Res>(
        _value.respostaEsperada!, (value) {
      return _then(_value.copyWith(respostaEsperada: value));
    });
  }
}

/// @nodoc
abstract class _$AtividadeItensCopyWith<$Res>
    implements $AtividadeItensCopyWith<$Res> {
  factory _$AtividadeItensCopyWith(
          _AtividadeItens value, $Res Function(_AtividadeItens) then) =
      __$AtividadeItensCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idQuestao,
      String enunciado,
      double peso,
      List<QuestaoAlternativaAlternativa>? alternativas,
      QuestaoDissertativaRespostaEsperada? respostaEsperada});

  @override
  $QuestaoDissertativaRespostaEsperadaCopyWith<$Res>? get respostaEsperada;
}

/// @nodoc
class __$AtividadeItensCopyWithImpl<$Res>
    extends _$AtividadeItensCopyWithImpl<$Res>
    implements _$AtividadeItensCopyWith<$Res> {
  __$AtividadeItensCopyWithImpl(
      _AtividadeItens _value, $Res Function(_AtividadeItens) _then)
      : super(_value, (v) => _then(v as _AtividadeItens));

  @override
  _AtividadeItens get _value => super._value as _AtividadeItens;

  @override
  $Res call({
    Object? idQuestao = freezed,
    Object? enunciado = freezed,
    Object? peso = freezed,
    Object? alternativas = freezed,
    Object? respostaEsperada = freezed,
  }) {
    return _then(_AtividadeItens(
      idQuestao == freezed
          ? _value.idQuestao
          : idQuestao // ignore: cast_nullable_to_non_nullable
              as String,
      enunciado == freezed
          ? _value.enunciado
          : enunciado // ignore: cast_nullable_to_non_nullable
              as String,
      peso == freezed
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      alternativas == freezed
          ? _value.alternativas
          : alternativas // ignore: cast_nullable_to_non_nullable
              as List<QuestaoAlternativaAlternativa>?,
      respostaEsperada == freezed
          ? _value.respostaEsperada
          : respostaEsperada // ignore: cast_nullable_to_non_nullable
              as QuestaoDissertativaRespostaEsperada?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AtividadeItens implements _AtividadeItens {
  const _$_AtividadeItens(this.idQuestao, this.enunciado, this.peso,
      this.alternativas, this.respostaEsperada);

  factory _$_AtividadeItens.fromJson(Map<String, dynamic> json) =>
      _$$_AtividadeItensFromJson(json);

  @override
  final String idQuestao;
  @override
  final String enunciado;
  @override
  final double peso;
  @override
  final List<QuestaoAlternativaAlternativa>? alternativas;
  @override
  final QuestaoDissertativaRespostaEsperada? respostaEsperada;

  @override
  String toString() {
    return 'AtividadeItens(idQuestao: $idQuestao, enunciado: $enunciado, peso: $peso, alternativas: $alternativas, respostaEsperada: $respostaEsperada)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AtividadeItens &&
            const DeepCollectionEquality().equals(other.idQuestao, idQuestao) &&
            const DeepCollectionEquality().equals(other.enunciado, enunciado) &&
            const DeepCollectionEquality().equals(other.peso, peso) &&
            const DeepCollectionEquality()
                .equals(other.alternativas, alternativas) &&
            const DeepCollectionEquality()
                .equals(other.respostaEsperada, respostaEsperada));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idQuestao),
      const DeepCollectionEquality().hash(enunciado),
      const DeepCollectionEquality().hash(peso),
      const DeepCollectionEquality().hash(alternativas),
      const DeepCollectionEquality().hash(respostaEsperada));

  @JsonKey(ignore: true)
  @override
  _$AtividadeItensCopyWith<_AtividadeItens> get copyWith =>
      __$AtividadeItensCopyWithImpl<_AtividadeItens>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AtividadeItensToJson(this);
  }
}

abstract class _AtividadeItens implements AtividadeItens {
  const factory _AtividadeItens(
          String idQuestao,
          String enunciado,
          double peso,
          List<QuestaoAlternativaAlternativa>? alternativas,
          QuestaoDissertativaRespostaEsperada? respostaEsperada) =
      _$_AtividadeItens;

  factory _AtividadeItens.fromJson(Map<String, dynamic> json) =
      _$_AtividadeItens.fromJson;

  @override
  String get idQuestao;
  @override
  String get enunciado;
  @override
  double get peso;
  @override
  List<QuestaoAlternativaAlternativa>? get alternativas;
  @override
  QuestaoDissertativaRespostaEsperada? get respostaEsperada;
  @override
  @JsonKey(ignore: true)
  _$AtividadeItensCopyWith<_AtividadeItens> get copyWith =>
      throw _privateConstructorUsedError;
}
