// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Curso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Curso _$CursoFromJson(Map<String, dynamic> json) {
  return _Curso.fromJson(json);
}

/// @nodoc
class _$CursoTearOff {
  const _$CursoTearOff();

  _Curso call(
      String id,
      String idProjeto,
      String nome,
      String descricao,
      DateTime inicioCurso,
      DateTime fimCurso,
      DateTime atualizadoEm,
      List<String> turma,
      List<Materia> materias) {
    return _Curso(
      id,
      idProjeto,
      nome,
      descricao,
      inicioCurso,
      fimCurso,
      atualizadoEm,
      turma,
      materias,
    );
  }

  Curso fromJson(Map<String, Object?> json) {
    return Curso.fromJson(json);
  }
}

/// @nodoc
const $Curso = _$CursoTearOff();

/// @nodoc
mixin _$Curso {
  String get id => throw _privateConstructorUsedError;
  String get idProjeto => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  DateTime get inicioCurso => throw _privateConstructorUsedError;
  DateTime get fimCurso => throw _privateConstructorUsedError;
  DateTime get atualizadoEm => throw _privateConstructorUsedError;
  List<String> get turma => throw _privateConstructorUsedError;
  List<Materia> get materias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CursoCopyWith<Curso> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursoCopyWith<$Res> {
  factory $CursoCopyWith(Curso value, $Res Function(Curso) then) =
      _$CursoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String idProjeto,
      String nome,
      String descricao,
      DateTime inicioCurso,
      DateTime fimCurso,
      DateTime atualizadoEm,
      List<String> turma,
      List<Materia> materias});
}

/// @nodoc
class _$CursoCopyWithImpl<$Res> implements $CursoCopyWith<$Res> {
  _$CursoCopyWithImpl(this._value, this._then);

  final Curso _value;
  // ignore: unused_field
  final $Res Function(Curso) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idProjeto = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? inicioCurso = freezed,
    Object? fimCurso = freezed,
    Object? atualizadoEm = freezed,
    Object? turma = freezed,
    Object? materias = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idProjeto: idProjeto == freezed
          ? _value.idProjeto
          : idProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      inicioCurso: inicioCurso == freezed
          ? _value.inicioCurso
          : inicioCurso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fimCurso: fimCurso == freezed
          ? _value.fimCurso
          : fimCurso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      turma: turma == freezed
          ? _value.turma
          : turma // ignore: cast_nullable_to_non_nullable
              as List<String>,
      materias: materias == freezed
          ? _value.materias
          : materias // ignore: cast_nullable_to_non_nullable
              as List<Materia>,
    ));
  }
}

/// @nodoc
abstract class _$CursoCopyWith<$Res> implements $CursoCopyWith<$Res> {
  factory _$CursoCopyWith(_Curso value, $Res Function(_Curso) then) =
      __$CursoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String idProjeto,
      String nome,
      String descricao,
      DateTime inicioCurso,
      DateTime fimCurso,
      DateTime atualizadoEm,
      List<String> turma,
      List<Materia> materias});
}

/// @nodoc
class __$CursoCopyWithImpl<$Res> extends _$CursoCopyWithImpl<$Res>
    implements _$CursoCopyWith<$Res> {
  __$CursoCopyWithImpl(_Curso _value, $Res Function(_Curso) _then)
      : super(_value, (v) => _then(v as _Curso));

  @override
  _Curso get _value => super._value as _Curso;

  @override
  $Res call({
    Object? id = freezed,
    Object? idProjeto = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? inicioCurso = freezed,
    Object? fimCurso = freezed,
    Object? atualizadoEm = freezed,
    Object? turma = freezed,
    Object? materias = freezed,
  }) {
    return _then(_Curso(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idProjeto == freezed
          ? _value.idProjeto
          : idProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      inicioCurso == freezed
          ? _value.inicioCurso
          : inicioCurso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fimCurso == freezed
          ? _value.fimCurso
          : fimCurso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      turma == freezed
          ? _value.turma
          : turma // ignore: cast_nullable_to_non_nullable
              as List<String>,
      materias == freezed
          ? _value.materias
          : materias // ignore: cast_nullable_to_non_nullable
              as List<Materia>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Curso implements _Curso {
  const _$_Curso(
      this.id,
      this.idProjeto,
      this.nome,
      this.descricao,
      this.inicioCurso,
      this.fimCurso,
      this.atualizadoEm,
      this.turma,
      this.materias);

  factory _$_Curso.fromJson(Map<String, dynamic> json) =>
      _$$_CursoFromJson(json);

  @override
  final String id;
  @override
  final String idProjeto;
  @override
  final String nome;
  @override
  final String descricao;
  @override
  final DateTime inicioCurso;
  @override
  final DateTime fimCurso;
  @override
  final DateTime atualizadoEm;
  @override
  final List<String> turma;
  @override
  final List<Materia> materias;

  @override
  String toString() {
    return 'Curso(id: $id, idProjeto: $idProjeto, nome: $nome, descricao: $descricao, inicioCurso: $inicioCurso, fimCurso: $fimCurso, atualizadoEm: $atualizadoEm, turma: $turma, materias: $materias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Curso &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.idProjeto, idProjeto) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.descricao, descricao) &&
            const DeepCollectionEquality()
                .equals(other.inicioCurso, inicioCurso) &&
            const DeepCollectionEquality().equals(other.fimCurso, fimCurso) &&
            const DeepCollectionEquality()
                .equals(other.atualizadoEm, atualizadoEm) &&
            const DeepCollectionEquality().equals(other.turma, turma) &&
            const DeepCollectionEquality().equals(other.materias, materias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(idProjeto),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(descricao),
      const DeepCollectionEquality().hash(inicioCurso),
      const DeepCollectionEquality().hash(fimCurso),
      const DeepCollectionEquality().hash(atualizadoEm),
      const DeepCollectionEquality().hash(turma),
      const DeepCollectionEquality().hash(materias));

  @JsonKey(ignore: true)
  @override
  _$CursoCopyWith<_Curso> get copyWith =>
      __$CursoCopyWithImpl<_Curso>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CursoToJson(this);
  }
}

abstract class _Curso implements Curso {
  const factory _Curso(
      String id,
      String idProjeto,
      String nome,
      String descricao,
      DateTime inicioCurso,
      DateTime fimCurso,
      DateTime atualizadoEm,
      List<String> turma,
      List<Materia> materias) = _$_Curso;

  factory _Curso.fromJson(Map<String, dynamic> json) = _$_Curso.fromJson;

  @override
  String get id;
  @override
  String get idProjeto;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  DateTime get inicioCurso;
  @override
  DateTime get fimCurso;
  @override
  DateTime get atualizadoEm;
  @override
  List<String> get turma;
  @override
  List<Materia> get materias;
  @override
  @JsonKey(ignore: true)
  _$CursoCopyWith<_Curso> get copyWith => throw _privateConstructorUsedError;
}
