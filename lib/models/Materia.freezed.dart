// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Materia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Materia _$MateriaFromJson(Map<String, dynamic> json) {
  return _Materia.fromJson(json);
}

/// @nodoc
class _$MateriaTearOff {
  const _$MateriaTearOff();

  _Materia call(String id, String? idPerfilProfessor, String nome,
      String descricao, String idCurso) {
    return _Materia(
      id,
      idPerfilProfessor,
      nome,
      descricao,
      idCurso,
    );
  }

  Materia fromJson(Map<String, Object?> json) {
    return Materia.fromJson(json);
  }
}

/// @nodoc
const $Materia = _$MateriaTearOff();

/// @nodoc
mixin _$Materia {
  String get id => throw _privateConstructorUsedError;
  String? get idPerfilProfessor => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  String get idCurso => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MateriaCopyWith<Materia> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MateriaCopyWith<$Res> {
  factory $MateriaCopyWith(Materia value, $Res Function(Materia) then) =
      _$MateriaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? idPerfilProfessor,
      String nome,
      String descricao,
      String idCurso});
}

/// @nodoc
class _$MateriaCopyWithImpl<$Res> implements $MateriaCopyWith<$Res> {
  _$MateriaCopyWithImpl(this._value, this._then);

  final Materia _value;
  // ignore: unused_field
  final $Res Function(Materia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idPerfilProfessor = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? idCurso = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idPerfilProfessor: idPerfilProfessor == freezed
          ? _value.idPerfilProfessor
          : idPerfilProfessor // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idCurso: idCurso == freezed
          ? _value.idCurso
          : idCurso // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MateriaCopyWith<$Res> implements $MateriaCopyWith<$Res> {
  factory _$MateriaCopyWith(_Materia value, $Res Function(_Materia) then) =
      __$MateriaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? idPerfilProfessor,
      String nome,
      String descricao,
      String idCurso});
}

/// @nodoc
class __$MateriaCopyWithImpl<$Res> extends _$MateriaCopyWithImpl<$Res>
    implements _$MateriaCopyWith<$Res> {
  __$MateriaCopyWithImpl(_Materia _value, $Res Function(_Materia) _then)
      : super(_value, (v) => _then(v as _Materia));

  @override
  _Materia get _value => super._value as _Materia;

  @override
  $Res call({
    Object? id = freezed,
    Object? idPerfilProfessor = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? idCurso = freezed,
  }) {
    return _then(_Materia(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idPerfilProfessor == freezed
          ? _value.idPerfilProfessor
          : idPerfilProfessor // ignore: cast_nullable_to_non_nullable
              as String?,
      nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idCurso == freezed
          ? _value.idCurso
          : idCurso // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Materia implements _Materia {
  const _$_Materia(
      this.id, this.idPerfilProfessor, this.nome, this.descricao, this.idCurso);

  factory _$_Materia.fromJson(Map<String, dynamic> json) =>
      _$$_MateriaFromJson(json);

  @override
  final String id;
  @override
  final String? idPerfilProfessor;
  @override
  final String nome;
  @override
  final String descricao;
  @override
  final String idCurso;

  @override
  String toString() {
    return 'Materia(id: $id, idPerfilProfessor: $idPerfilProfessor, nome: $nome, descricao: $descricao, idCurso: $idCurso)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Materia &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.idPerfilProfessor, idPerfilProfessor) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.descricao, descricao) &&
            const DeepCollectionEquality().equals(other.idCurso, idCurso));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(idPerfilProfessor),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(descricao),
      const DeepCollectionEquality().hash(idCurso));

  @JsonKey(ignore: true)
  @override
  _$MateriaCopyWith<_Materia> get copyWith =>
      __$MateriaCopyWithImpl<_Materia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MateriaToJson(this);
  }
}

abstract class _Materia implements Materia {
  const factory _Materia(String id, String? idPerfilProfessor, String nome,
      String descricao, String idCurso) = _$_Materia;

  factory _Materia.fromJson(Map<String, dynamic> json) = _$_Materia.fromJson;

  @override
  String get id;
  @override
  String? get idPerfilProfessor;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  String get idCurso;
  @override
  @JsonKey(ignore: true)
  _$MateriaCopyWith<_Materia> get copyWith =>
      throw _privateConstructorUsedError;
}
