// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Duvida.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Duvida _$DuvidaFromJson(Map<String, dynamic> json) {
  return _Duvida.fromJson(json);
}

/// @nodoc
class _$DuvidaTearOff {
  const _$DuvidaTearOff();

  _Duvida call(
      String id,
      String titulo,
      String descricao,
      String idAluno,
      String idCursoAluno,
      String? idMateria,
      String? idCursoUniversitario,
      bool resolvida,
      List<DuvidaMensagem> mensagens) {
    return _Duvida(
      id,
      titulo,
      descricao,
      idAluno,
      idCursoAluno,
      idMateria,
      idCursoUniversitario,
      resolvida,
      mensagens,
    );
  }

  Duvida fromJson(Map<String, Object?> json) {
    return Duvida.fromJson(json);
  }
}

/// @nodoc
const $Duvida = _$DuvidaTearOff();

/// @nodoc
mixin _$Duvida {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  String get idAluno => throw _privateConstructorUsedError;
  String get idCursoAluno => throw _privateConstructorUsedError;
  String? get idMateria => throw _privateConstructorUsedError;
  String? get idCursoUniversitario => throw _privateConstructorUsedError;
  bool get resolvida => throw _privateConstructorUsedError;
  List<DuvidaMensagem> get mensagens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuvidaCopyWith<Duvida> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuvidaCopyWith<$Res> {
  factory $DuvidaCopyWith(Duvida value, $Res Function(Duvida) then) =
      _$DuvidaCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String titulo,
      String descricao,
      String idAluno,
      String idCursoAluno,
      String? idMateria,
      String? idCursoUniversitario,
      bool resolvida,
      List<DuvidaMensagem> mensagens});
}

/// @nodoc
class _$DuvidaCopyWithImpl<$Res> implements $DuvidaCopyWith<$Res> {
  _$DuvidaCopyWithImpl(this._value, this._then);

  final Duvida _value;
  // ignore: unused_field
  final $Res Function(Duvida) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? titulo = freezed,
    Object? descricao = freezed,
    Object? idAluno = freezed,
    Object? idCursoAluno = freezed,
    Object? idMateria = freezed,
    Object? idCursoUniversitario = freezed,
    Object? resolvida = freezed,
    Object? mensagens = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titulo: titulo == freezed
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idAluno: idAluno == freezed
          ? _value.idAluno
          : idAluno // ignore: cast_nullable_to_non_nullable
              as String,
      idCursoAluno: idCursoAluno == freezed
          ? _value.idCursoAluno
          : idCursoAluno // ignore: cast_nullable_to_non_nullable
              as String,
      idMateria: idMateria == freezed
          ? _value.idMateria
          : idMateria // ignore: cast_nullable_to_non_nullable
              as String?,
      idCursoUniversitario: idCursoUniversitario == freezed
          ? _value.idCursoUniversitario
          : idCursoUniversitario // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvida: resolvida == freezed
          ? _value.resolvida
          : resolvida // ignore: cast_nullable_to_non_nullable
              as bool,
      mensagens: mensagens == freezed
          ? _value.mensagens
          : mensagens // ignore: cast_nullable_to_non_nullable
              as List<DuvidaMensagem>,
    ));
  }
}

/// @nodoc
abstract class _$DuvidaCopyWith<$Res> implements $DuvidaCopyWith<$Res> {
  factory _$DuvidaCopyWith(_Duvida value, $Res Function(_Duvida) then) =
      __$DuvidaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String titulo,
      String descricao,
      String idAluno,
      String idCursoAluno,
      String? idMateria,
      String? idCursoUniversitario,
      bool resolvida,
      List<DuvidaMensagem> mensagens});
}

/// @nodoc
class __$DuvidaCopyWithImpl<$Res> extends _$DuvidaCopyWithImpl<$Res>
    implements _$DuvidaCopyWith<$Res> {
  __$DuvidaCopyWithImpl(_Duvida _value, $Res Function(_Duvida) _then)
      : super(_value, (v) => _then(v as _Duvida));

  @override
  _Duvida get _value => super._value as _Duvida;

  @override
  $Res call({
    Object? id = freezed,
    Object? titulo = freezed,
    Object? descricao = freezed,
    Object? idAluno = freezed,
    Object? idCursoAluno = freezed,
    Object? idMateria = freezed,
    Object? idCursoUniversitario = freezed,
    Object? resolvida = freezed,
    Object? mensagens = freezed,
  }) {
    return _then(_Duvida(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      titulo == freezed
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idAluno == freezed
          ? _value.idAluno
          : idAluno // ignore: cast_nullable_to_non_nullable
              as String,
      idCursoAluno == freezed
          ? _value.idCursoAluno
          : idCursoAluno // ignore: cast_nullable_to_non_nullable
              as String,
      idMateria == freezed
          ? _value.idMateria
          : idMateria // ignore: cast_nullable_to_non_nullable
              as String?,
      idCursoUniversitario == freezed
          ? _value.idCursoUniversitario
          : idCursoUniversitario // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvida == freezed
          ? _value.resolvida
          : resolvida // ignore: cast_nullable_to_non_nullable
              as bool,
      mensagens == freezed
          ? _value.mensagens
          : mensagens // ignore: cast_nullable_to_non_nullable
              as List<DuvidaMensagem>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Duvida implements _Duvida {
  const _$_Duvida(
      this.id,
      this.titulo,
      this.descricao,
      this.idAluno,
      this.idCursoAluno,
      this.idMateria,
      this.idCursoUniversitario,
      this.resolvida,
      this.mensagens);

  factory _$_Duvida.fromJson(Map<String, dynamic> json) =>
      _$$_DuvidaFromJson(json);

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String descricao;
  @override
  final String idAluno;
  @override
  final String idCursoAluno;
  @override
  final String? idMateria;
  @override
  final String? idCursoUniversitario;
  @override
  final bool resolvida;
  @override
  final List<DuvidaMensagem> mensagens;

  @override
  String toString() {
    return 'Duvida(id: $id, titulo: $titulo, descricao: $descricao, idAluno: $idAluno, idCursoAluno: $idCursoAluno, idMateria: $idMateria, idCursoUniversitario: $idCursoUniversitario, resolvida: $resolvida, mensagens: $mensagens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Duvida &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.titulo, titulo) &&
            const DeepCollectionEquality().equals(other.descricao, descricao) &&
            const DeepCollectionEquality().equals(other.idAluno, idAluno) &&
            const DeepCollectionEquality()
                .equals(other.idCursoAluno, idCursoAluno) &&
            const DeepCollectionEquality().equals(other.idMateria, idMateria) &&
            const DeepCollectionEquality()
                .equals(other.idCursoUniversitario, idCursoUniversitario) &&
            const DeepCollectionEquality().equals(other.resolvida, resolvida) &&
            const DeepCollectionEquality().equals(other.mensagens, mensagens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(titulo),
      const DeepCollectionEquality().hash(descricao),
      const DeepCollectionEquality().hash(idAluno),
      const DeepCollectionEquality().hash(idCursoAluno),
      const DeepCollectionEquality().hash(idMateria),
      const DeepCollectionEquality().hash(idCursoUniversitario),
      const DeepCollectionEquality().hash(resolvida),
      const DeepCollectionEquality().hash(mensagens));

  @JsonKey(ignore: true)
  @override
  _$DuvidaCopyWith<_Duvida> get copyWith =>
      __$DuvidaCopyWithImpl<_Duvida>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DuvidaToJson(this);
  }
}

abstract class _Duvida implements Duvida {
  const factory _Duvida(
      String id,
      String titulo,
      String descricao,
      String idAluno,
      String idCursoAluno,
      String? idMateria,
      String? idCursoUniversitario,
      bool resolvida,
      List<DuvidaMensagem> mensagens) = _$_Duvida;

  factory _Duvida.fromJson(Map<String, dynamic> json) = _$_Duvida.fromJson;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String get descricao;
  @override
  String get idAluno;
  @override
  String get idCursoAluno;
  @override
  String? get idMateria;
  @override
  String? get idCursoUniversitario;
  @override
  bool get resolvida;
  @override
  List<DuvidaMensagem> get mensagens;
  @override
  @JsonKey(ignore: true)
  _$DuvidaCopyWith<_Duvida> get copyWith => throw _privateConstructorUsedError;
}

DuvidaMensagem _$DuvidaMensagemFromJson(Map<String, dynamic> json) {
  return _DuvidaMensagem.fromJson(json);
}

/// @nodoc
class _$DuvidaMensagemTearOff {
  const _$DuvidaMensagemTearOff();

  _DuvidaMensagem call(String idPerfil, DateTime horario, String mensagem) {
    return _DuvidaMensagem(
      idPerfil,
      horario,
      mensagem,
    );
  }

  DuvidaMensagem fromJson(Map<String, Object?> json) {
    return DuvidaMensagem.fromJson(json);
  }
}

/// @nodoc
const $DuvidaMensagem = _$DuvidaMensagemTearOff();

/// @nodoc
mixin _$DuvidaMensagem {
  String get idPerfil => throw _privateConstructorUsedError;
  DateTime get horario => throw _privateConstructorUsedError;
  String get mensagem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuvidaMensagemCopyWith<DuvidaMensagem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuvidaMensagemCopyWith<$Res> {
  factory $DuvidaMensagemCopyWith(
          DuvidaMensagem value, $Res Function(DuvidaMensagem) then) =
      _$DuvidaMensagemCopyWithImpl<$Res>;
  $Res call({String idPerfil, DateTime horario, String mensagem});
}

/// @nodoc
class _$DuvidaMensagemCopyWithImpl<$Res>
    implements $DuvidaMensagemCopyWith<$Res> {
  _$DuvidaMensagemCopyWithImpl(this._value, this._then);

  final DuvidaMensagem _value;
  // ignore: unused_field
  final $Res Function(DuvidaMensagem) _then;

  @override
  $Res call({
    Object? idPerfil = freezed,
    Object? horario = freezed,
    Object? mensagem = freezed,
  }) {
    return _then(_value.copyWith(
      idPerfil: idPerfil == freezed
          ? _value.idPerfil
          : idPerfil // ignore: cast_nullable_to_non_nullable
              as String,
      horario: horario == freezed
          ? _value.horario
          : horario // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mensagem: mensagem == freezed
          ? _value.mensagem
          : mensagem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DuvidaMensagemCopyWith<$Res>
    implements $DuvidaMensagemCopyWith<$Res> {
  factory _$DuvidaMensagemCopyWith(
          _DuvidaMensagem value, $Res Function(_DuvidaMensagem) then) =
      __$DuvidaMensagemCopyWithImpl<$Res>;
  @override
  $Res call({String idPerfil, DateTime horario, String mensagem});
}

/// @nodoc
class __$DuvidaMensagemCopyWithImpl<$Res>
    extends _$DuvidaMensagemCopyWithImpl<$Res>
    implements _$DuvidaMensagemCopyWith<$Res> {
  __$DuvidaMensagemCopyWithImpl(
      _DuvidaMensagem _value, $Res Function(_DuvidaMensagem) _then)
      : super(_value, (v) => _then(v as _DuvidaMensagem));

  @override
  _DuvidaMensagem get _value => super._value as _DuvidaMensagem;

  @override
  $Res call({
    Object? idPerfil = freezed,
    Object? horario = freezed,
    Object? mensagem = freezed,
  }) {
    return _then(_DuvidaMensagem(
      idPerfil == freezed
          ? _value.idPerfil
          : idPerfil // ignore: cast_nullable_to_non_nullable
              as String,
      horario == freezed
          ? _value.horario
          : horario // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mensagem == freezed
          ? _value.mensagem
          : mensagem // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DuvidaMensagem implements _DuvidaMensagem {
  const _$_DuvidaMensagem(this.idPerfil, this.horario, this.mensagem);

  factory _$_DuvidaMensagem.fromJson(Map<String, dynamic> json) =>
      _$$_DuvidaMensagemFromJson(json);

  @override
  final String idPerfil;
  @override
  final DateTime horario;
  @override
  final String mensagem;

  @override
  String toString() {
    return 'DuvidaMensagem(idPerfil: $idPerfil, horario: $horario, mensagem: $mensagem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DuvidaMensagem &&
            const DeepCollectionEquality().equals(other.idPerfil, idPerfil) &&
            const DeepCollectionEquality().equals(other.horario, horario) &&
            const DeepCollectionEquality().equals(other.mensagem, mensagem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idPerfil),
      const DeepCollectionEquality().hash(horario),
      const DeepCollectionEquality().hash(mensagem));

  @JsonKey(ignore: true)
  @override
  _$DuvidaMensagemCopyWith<_DuvidaMensagem> get copyWith =>
      __$DuvidaMensagemCopyWithImpl<_DuvidaMensagem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DuvidaMensagemToJson(this);
  }
}

abstract class _DuvidaMensagem implements DuvidaMensagem {
  const factory _DuvidaMensagem(
      String idPerfil, DateTime horario, String mensagem) = _$_DuvidaMensagem;

  factory _DuvidaMensagem.fromJson(Map<String, dynamic> json) =
      _$_DuvidaMensagem.fromJson;

  @override
  String get idPerfil;
  @override
  DateTime get horario;
  @override
  String get mensagem;
  @override
  @JsonKey(ignore: true)
  _$DuvidaMensagemCopyWith<_DuvidaMensagem> get copyWith =>
      throw _privateConstructorUsedError;
}
