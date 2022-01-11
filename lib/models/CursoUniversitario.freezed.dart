// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'CursoUniversitario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CursoUniversitario _$CursoUniversitarioFromJson(Map<String, dynamic> json) {
  return _CursoUniversitario.fromJson(json);
}

/// @nodoc
class _$CursoUniversitarioTearOff {
  const _$CursoUniversitarioTearOff();

  _CursoUniversitario call(String id, String nome, String descricao,
      int semestresPrevistos, CursoUniversitario? cursoAnterior) {
    return _CursoUniversitario(
      id,
      nome,
      descricao,
      semestresPrevistos,
      cursoAnterior,
    );
  }

  CursoUniversitario fromJson(Map<String, Object?> json) {
    return CursoUniversitario.fromJson(json);
  }
}

/// @nodoc
const $CursoUniversitario = _$CursoUniversitarioTearOff();

/// @nodoc
mixin _$CursoUniversitario {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  int get semestresPrevistos => throw _privateConstructorUsedError;
  CursoUniversitario? get cursoAnterior => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CursoUniversitarioCopyWith<CursoUniversitario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursoUniversitarioCopyWith<$Res> {
  factory $CursoUniversitarioCopyWith(
          CursoUniversitario value, $Res Function(CursoUniversitario) then) =
      _$CursoUniversitarioCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String nome,
      String descricao,
      int semestresPrevistos,
      CursoUniversitario? cursoAnterior});

  $CursoUniversitarioCopyWith<$Res>? get cursoAnterior;
}

/// @nodoc
class _$CursoUniversitarioCopyWithImpl<$Res>
    implements $CursoUniversitarioCopyWith<$Res> {
  _$CursoUniversitarioCopyWithImpl(this._value, this._then);

  final CursoUniversitario _value;
  // ignore: unused_field
  final $Res Function(CursoUniversitario) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? semestresPrevistos = freezed,
    Object? cursoAnterior = freezed,
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
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      semestresPrevistos: semestresPrevistos == freezed
          ? _value.semestresPrevistos
          : semestresPrevistos // ignore: cast_nullable_to_non_nullable
              as int,
      cursoAnterior: cursoAnterior == freezed
          ? _value.cursoAnterior
          : cursoAnterior // ignore: cast_nullable_to_non_nullable
              as CursoUniversitario?,
    ));
  }

  @override
  $CursoUniversitarioCopyWith<$Res>? get cursoAnterior {
    if (_value.cursoAnterior == null) {
      return null;
    }

    return $CursoUniversitarioCopyWith<$Res>(_value.cursoAnterior!, (value) {
      return _then(_value.copyWith(cursoAnterior: value));
    });
  }
}

/// @nodoc
abstract class _$CursoUniversitarioCopyWith<$Res>
    implements $CursoUniversitarioCopyWith<$Res> {
  factory _$CursoUniversitarioCopyWith(
          _CursoUniversitario value, $Res Function(_CursoUniversitario) then) =
      __$CursoUniversitarioCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String nome,
      String descricao,
      int semestresPrevistos,
      CursoUniversitario? cursoAnterior});

  @override
  $CursoUniversitarioCopyWith<$Res>? get cursoAnterior;
}

/// @nodoc
class __$CursoUniversitarioCopyWithImpl<$Res>
    extends _$CursoUniversitarioCopyWithImpl<$Res>
    implements _$CursoUniversitarioCopyWith<$Res> {
  __$CursoUniversitarioCopyWithImpl(
      _CursoUniversitario _value, $Res Function(_CursoUniversitario) _then)
      : super(_value, (v) => _then(v as _CursoUniversitario));

  @override
  _CursoUniversitario get _value => super._value as _CursoUniversitario;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? semestresPrevistos = freezed,
    Object? cursoAnterior = freezed,
  }) {
    return _then(_CursoUniversitario(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      semestresPrevistos == freezed
          ? _value.semestresPrevistos
          : semestresPrevistos // ignore: cast_nullable_to_non_nullable
              as int,
      cursoAnterior == freezed
          ? _value.cursoAnterior
          : cursoAnterior // ignore: cast_nullable_to_non_nullable
              as CursoUniversitario?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CursoUniversitario implements _CursoUniversitario {
  const _$_CursoUniversitario(this.id, this.nome, this.descricao,
      this.semestresPrevistos, this.cursoAnterior);

  factory _$_CursoUniversitario.fromJson(Map<String, dynamic> json) =>
      _$$_CursoUniversitarioFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String descricao;
  @override
  final int semestresPrevistos;
  @override
  final CursoUniversitario? cursoAnterior;

  @override
  String toString() {
    return 'CursoUniversitario(id: $id, nome: $nome, descricao: $descricao, semestresPrevistos: $semestresPrevistos, cursoAnterior: $cursoAnterior)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CursoUniversitario &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.descricao, descricao) &&
            const DeepCollectionEquality()
                .equals(other.semestresPrevistos, semestresPrevistos) &&
            const DeepCollectionEquality()
                .equals(other.cursoAnterior, cursoAnterior));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(descricao),
      const DeepCollectionEquality().hash(semestresPrevistos),
      const DeepCollectionEquality().hash(cursoAnterior));

  @JsonKey(ignore: true)
  @override
  _$CursoUniversitarioCopyWith<_CursoUniversitario> get copyWith =>
      __$CursoUniversitarioCopyWithImpl<_CursoUniversitario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CursoUniversitarioToJson(this);
  }
}

abstract class _CursoUniversitario implements CursoUniversitario {
  const factory _CursoUniversitario(
      String id,
      String nome,
      String descricao,
      int semestresPrevistos,
      CursoUniversitario? cursoAnterior) = _$_CursoUniversitario;

  factory _CursoUniversitario.fromJson(Map<String, dynamic> json) =
      _$_CursoUniversitario.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  int get semestresPrevistos;
  @override
  CursoUniversitario? get cursoAnterior;
  @override
  @JsonKey(ignore: true)
  _$CursoUniversitarioCopyWith<_CursoUniversitario> get copyWith =>
      throw _privateConstructorUsedError;
}
