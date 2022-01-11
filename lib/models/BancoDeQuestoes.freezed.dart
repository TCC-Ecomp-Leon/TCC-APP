// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BancoDeQuestoes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BancoDeQuestoes _$BancoDeQuestoesFromJson(Map<String, dynamic> json) {
  return _BancoDeQuestoes.fromJson(json);
}

/// @nodoc
class _$BancoDeQuestoesTearOff {
  const _$BancoDeQuestoesTearOff();

  _BancoDeQuestoes call(
      String id,
      DateTime criadoEm,
      String idProjeto,
      String idCurso,
      String? idMateria,
      QuestaoBancoDeQuestoes questao,
      List<String> assuntos) {
    return _BancoDeQuestoes(
      id,
      criadoEm,
      idProjeto,
      idCurso,
      idMateria,
      questao,
      assuntos,
    );
  }

  BancoDeQuestoes fromJson(Map<String, Object?> json) {
    return BancoDeQuestoes.fromJson(json);
  }
}

/// @nodoc
const $BancoDeQuestoes = _$BancoDeQuestoesTearOff();

/// @nodoc
mixin _$BancoDeQuestoes {
  String get id => throw _privateConstructorUsedError;
  DateTime get criadoEm => throw _privateConstructorUsedError;
  String get idProjeto => throw _privateConstructorUsedError;
  String get idCurso => throw _privateConstructorUsedError;
  String? get idMateria => throw _privateConstructorUsedError;
  QuestaoBancoDeQuestoes get questao => throw _privateConstructorUsedError;
  List<String> get assuntos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BancoDeQuestoesCopyWith<BancoDeQuestoes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BancoDeQuestoesCopyWith<$Res> {
  factory $BancoDeQuestoesCopyWith(
          BancoDeQuestoes value, $Res Function(BancoDeQuestoes) then) =
      _$BancoDeQuestoesCopyWithImpl<$Res>;
  $Res call(
      {String id,
      DateTime criadoEm,
      String idProjeto,
      String idCurso,
      String? idMateria,
      QuestaoBancoDeQuestoes questao,
      List<String> assuntos});

  $QuestaoBancoDeQuestoesCopyWith<$Res> get questao;
}

/// @nodoc
class _$BancoDeQuestoesCopyWithImpl<$Res>
    implements $BancoDeQuestoesCopyWith<$Res> {
  _$BancoDeQuestoesCopyWithImpl(this._value, this._then);

  final BancoDeQuestoes _value;
  // ignore: unused_field
  final $Res Function(BancoDeQuestoes) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? criadoEm = freezed,
    Object? idProjeto = freezed,
    Object? idCurso = freezed,
    Object? idMateria = freezed,
    Object? questao = freezed,
    Object? assuntos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      questao: questao == freezed
          ? _value.questao
          : questao // ignore: cast_nullable_to_non_nullable
              as QuestaoBancoDeQuestoes,
      assuntos: assuntos == freezed
          ? _value.assuntos
          : assuntos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $QuestaoBancoDeQuestoesCopyWith<$Res> get questao {
    return $QuestaoBancoDeQuestoesCopyWith<$Res>(_value.questao, (value) {
      return _then(_value.copyWith(questao: value));
    });
  }
}

/// @nodoc
abstract class _$BancoDeQuestoesCopyWith<$Res>
    implements $BancoDeQuestoesCopyWith<$Res> {
  factory _$BancoDeQuestoesCopyWith(
          _BancoDeQuestoes value, $Res Function(_BancoDeQuestoes) then) =
      __$BancoDeQuestoesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      DateTime criadoEm,
      String idProjeto,
      String idCurso,
      String? idMateria,
      QuestaoBancoDeQuestoes questao,
      List<String> assuntos});

  @override
  $QuestaoBancoDeQuestoesCopyWith<$Res> get questao;
}

/// @nodoc
class __$BancoDeQuestoesCopyWithImpl<$Res>
    extends _$BancoDeQuestoesCopyWithImpl<$Res>
    implements _$BancoDeQuestoesCopyWith<$Res> {
  __$BancoDeQuestoesCopyWithImpl(
      _BancoDeQuestoes _value, $Res Function(_BancoDeQuestoes) _then)
      : super(_value, (v) => _then(v as _BancoDeQuestoes));

  @override
  _BancoDeQuestoes get _value => super._value as _BancoDeQuestoes;

  @override
  $Res call({
    Object? id = freezed,
    Object? criadoEm = freezed,
    Object? idProjeto = freezed,
    Object? idCurso = freezed,
    Object? idMateria = freezed,
    Object? questao = freezed,
    Object? assuntos = freezed,
  }) {
    return _then(_BancoDeQuestoes(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      questao == freezed
          ? _value.questao
          : questao // ignore: cast_nullable_to_non_nullable
              as QuestaoBancoDeQuestoes,
      assuntos == freezed
          ? _value.assuntos
          : assuntos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BancoDeQuestoes implements _BancoDeQuestoes {
  const _$_BancoDeQuestoes(this.id, this.criadoEm, this.idProjeto, this.idCurso,
      this.idMateria, this.questao, this.assuntos);

  factory _$_BancoDeQuestoes.fromJson(Map<String, dynamic> json) =>
      _$$_BancoDeQuestoesFromJson(json);

  @override
  final String id;
  @override
  final DateTime criadoEm;
  @override
  final String idProjeto;
  @override
  final String idCurso;
  @override
  final String? idMateria;
  @override
  final QuestaoBancoDeQuestoes questao;
  @override
  final List<String> assuntos;

  @override
  String toString() {
    return 'BancoDeQuestoes(id: $id, criadoEm: $criadoEm, idProjeto: $idProjeto, idCurso: $idCurso, idMateria: $idMateria, questao: $questao, assuntos: $assuntos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BancoDeQuestoes &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.criadoEm, criadoEm) &&
            const DeepCollectionEquality().equals(other.idProjeto, idProjeto) &&
            const DeepCollectionEquality().equals(other.idCurso, idCurso) &&
            const DeepCollectionEquality().equals(other.idMateria, idMateria) &&
            const DeepCollectionEquality().equals(other.questao, questao) &&
            const DeepCollectionEquality().equals(other.assuntos, assuntos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(criadoEm),
      const DeepCollectionEquality().hash(idProjeto),
      const DeepCollectionEquality().hash(idCurso),
      const DeepCollectionEquality().hash(idMateria),
      const DeepCollectionEquality().hash(questao),
      const DeepCollectionEquality().hash(assuntos));

  @JsonKey(ignore: true)
  @override
  _$BancoDeQuestoesCopyWith<_BancoDeQuestoes> get copyWith =>
      __$BancoDeQuestoesCopyWithImpl<_BancoDeQuestoes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BancoDeQuestoesToJson(this);
  }
}

abstract class _BancoDeQuestoes implements BancoDeQuestoes {
  const factory _BancoDeQuestoes(
      String id,
      DateTime criadoEm,
      String idProjeto,
      String idCurso,
      String? idMateria,
      QuestaoBancoDeQuestoes questao,
      List<String> assuntos) = _$_BancoDeQuestoes;

  factory _BancoDeQuestoes.fromJson(Map<String, dynamic> json) =
      _$_BancoDeQuestoes.fromJson;

  @override
  String get id;
  @override
  DateTime get criadoEm;
  @override
  String get idProjeto;
  @override
  String get idCurso;
  @override
  String? get idMateria;
  @override
  QuestaoBancoDeQuestoes get questao;
  @override
  List<String> get assuntos;
  @override
  @JsonKey(ignore: true)
  _$BancoDeQuestoesCopyWith<_BancoDeQuestoes> get copyWith =>
      throw _privateConstructorUsedError;
}
