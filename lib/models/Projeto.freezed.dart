// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Projeto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Projeto _$ProjetoFromJson(Map<String, dynamic> json) {
  return _Projeto.fromJson(json);
}

/// @nodoc
class _$ProjetoTearOff {
  const _$ProjetoTearOff();

  _Projeto call(
      String id,
      String nome,
      String descricao,
      int telefone,
      DateTime requisicaoEntradaEm,
      String imgProjeto,
      Endereco endereco,
      bool aprovado,
      String? idPerfilResponsavel,
      DateTime? entradaEm,
      List<Curso> cursos) {
    return _Projeto(
      id,
      nome,
      descricao,
      telefone,
      requisicaoEntradaEm,
      imgProjeto,
      endereco,
      aprovado,
      idPerfilResponsavel,
      entradaEm,
      cursos,
    );
  }

  Projeto fromJson(Map<String, Object?> json) {
    return Projeto.fromJson(json);
  }
}

/// @nodoc
const $Projeto = _$ProjetoTearOff();

/// @nodoc
mixin _$Projeto {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  int get telefone => throw _privateConstructorUsedError;
  DateTime get requisicaoEntradaEm => throw _privateConstructorUsedError;
  String get imgProjeto => throw _privateConstructorUsedError;
  Endereco get endereco => throw _privateConstructorUsedError;
  bool get aprovado => throw _privateConstructorUsedError;
  String? get idPerfilResponsavel => throw _privateConstructorUsedError;
  DateTime? get entradaEm => throw _privateConstructorUsedError;
  List<Curso> get cursos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjetoCopyWith<Projeto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjetoCopyWith<$Res> {
  factory $ProjetoCopyWith(Projeto value, $Res Function(Projeto) then) =
      _$ProjetoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String nome,
      String descricao,
      int telefone,
      DateTime requisicaoEntradaEm,
      String imgProjeto,
      Endereco endereco,
      bool aprovado,
      String? idPerfilResponsavel,
      DateTime? entradaEm,
      List<Curso> cursos});

  $EnderecoCopyWith<$Res> get endereco;
}

/// @nodoc
class _$ProjetoCopyWithImpl<$Res> implements $ProjetoCopyWith<$Res> {
  _$ProjetoCopyWithImpl(this._value, this._then);

  final Projeto _value;
  // ignore: unused_field
  final $Res Function(Projeto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? telefone = freezed,
    Object? requisicaoEntradaEm = freezed,
    Object? imgProjeto = freezed,
    Object? endereco = freezed,
    Object? aprovado = freezed,
    Object? idPerfilResponsavel = freezed,
    Object? entradaEm = freezed,
    Object? cursos = freezed,
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
      telefone: telefone == freezed
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as int,
      requisicaoEntradaEm: requisicaoEntradaEm == freezed
          ? _value.requisicaoEntradaEm
          : requisicaoEntradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgProjeto: imgProjeto == freezed
          ? _value.imgProjeto
          : imgProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      endereco: endereco == freezed
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as Endereco,
      aprovado: aprovado == freezed
          ? _value.aprovado
          : aprovado // ignore: cast_nullable_to_non_nullable
              as bool,
      idPerfilResponsavel: idPerfilResponsavel == freezed
          ? _value.idPerfilResponsavel
          : idPerfilResponsavel // ignore: cast_nullable_to_non_nullable
              as String?,
      entradaEm: entradaEm == freezed
          ? _value.entradaEm
          : entradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cursos: cursos == freezed
          ? _value.cursos
          : cursos // ignore: cast_nullable_to_non_nullable
              as List<Curso>,
    ));
  }

  @override
  $EnderecoCopyWith<$Res> get endereco {
    return $EnderecoCopyWith<$Res>(_value.endereco, (value) {
      return _then(_value.copyWith(endereco: value));
    });
  }
}

/// @nodoc
abstract class _$ProjetoCopyWith<$Res> implements $ProjetoCopyWith<$Res> {
  factory _$ProjetoCopyWith(_Projeto value, $Res Function(_Projeto) then) =
      __$ProjetoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String nome,
      String descricao,
      int telefone,
      DateTime requisicaoEntradaEm,
      String imgProjeto,
      Endereco endereco,
      bool aprovado,
      String? idPerfilResponsavel,
      DateTime? entradaEm,
      List<Curso> cursos});

  @override
  $EnderecoCopyWith<$Res> get endereco;
}

/// @nodoc
class __$ProjetoCopyWithImpl<$Res> extends _$ProjetoCopyWithImpl<$Res>
    implements _$ProjetoCopyWith<$Res> {
  __$ProjetoCopyWithImpl(_Projeto _value, $Res Function(_Projeto) _then)
      : super(_value, (v) => _then(v as _Projeto));

  @override
  _Projeto get _value => super._value as _Projeto;

  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? descricao = freezed,
    Object? telefone = freezed,
    Object? requisicaoEntradaEm = freezed,
    Object? imgProjeto = freezed,
    Object? endereco = freezed,
    Object? aprovado = freezed,
    Object? idPerfilResponsavel = freezed,
    Object? entradaEm = freezed,
    Object? cursos = freezed,
  }) {
    return _then(_Projeto(
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
      telefone == freezed
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as int,
      requisicaoEntradaEm == freezed
          ? _value.requisicaoEntradaEm
          : requisicaoEntradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imgProjeto == freezed
          ? _value.imgProjeto
          : imgProjeto // ignore: cast_nullable_to_non_nullable
              as String,
      endereco == freezed
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as Endereco,
      aprovado == freezed
          ? _value.aprovado
          : aprovado // ignore: cast_nullable_to_non_nullable
              as bool,
      idPerfilResponsavel == freezed
          ? _value.idPerfilResponsavel
          : idPerfilResponsavel // ignore: cast_nullable_to_non_nullable
              as String?,
      entradaEm == freezed
          ? _value.entradaEm
          : entradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cursos == freezed
          ? _value.cursos
          : cursos // ignore: cast_nullable_to_non_nullable
              as List<Curso>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Projeto implements _Projeto {
  const _$_Projeto(
      this.id,
      this.nome,
      this.descricao,
      this.telefone,
      this.requisicaoEntradaEm,
      this.imgProjeto,
      this.endereco,
      this.aprovado,
      this.idPerfilResponsavel,
      this.entradaEm,
      this.cursos);

  factory _$_Projeto.fromJson(Map<String, dynamic> json) =>
      _$$_ProjetoFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String descricao;
  @override
  final int telefone;
  @override
  final DateTime requisicaoEntradaEm;
  @override
  final String imgProjeto;
  @override
  final Endereco endereco;
  @override
  final bool aprovado;
  @override
  final String? idPerfilResponsavel;
  @override
  final DateTime? entradaEm;
  @override
  final List<Curso> cursos;

  @override
  String toString() {
    return 'Projeto(id: $id, nome: $nome, descricao: $descricao, telefone: $telefone, requisicaoEntradaEm: $requisicaoEntradaEm, imgProjeto: $imgProjeto, endereco: $endereco, aprovado: $aprovado, idPerfilResponsavel: $idPerfilResponsavel, entradaEm: $entradaEm, cursos: $cursos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Projeto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.descricao, descricao) &&
            const DeepCollectionEquality().equals(other.telefone, telefone) &&
            const DeepCollectionEquality()
                .equals(other.requisicaoEntradaEm, requisicaoEntradaEm) &&
            const DeepCollectionEquality()
                .equals(other.imgProjeto, imgProjeto) &&
            const DeepCollectionEquality().equals(other.endereco, endereco) &&
            const DeepCollectionEquality().equals(other.aprovado, aprovado) &&
            const DeepCollectionEquality()
                .equals(other.idPerfilResponsavel, idPerfilResponsavel) &&
            const DeepCollectionEquality().equals(other.entradaEm, entradaEm) &&
            const DeepCollectionEquality().equals(other.cursos, cursos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(descricao),
      const DeepCollectionEquality().hash(telefone),
      const DeepCollectionEquality().hash(requisicaoEntradaEm),
      const DeepCollectionEquality().hash(imgProjeto),
      const DeepCollectionEquality().hash(endereco),
      const DeepCollectionEquality().hash(aprovado),
      const DeepCollectionEquality().hash(idPerfilResponsavel),
      const DeepCollectionEquality().hash(entradaEm),
      const DeepCollectionEquality().hash(cursos));

  @JsonKey(ignore: true)
  @override
  _$ProjetoCopyWith<_Projeto> get copyWith =>
      __$ProjetoCopyWithImpl<_Projeto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjetoToJson(this);
  }
}

abstract class _Projeto implements Projeto {
  const factory _Projeto(
      String id,
      String nome,
      String descricao,
      int telefone,
      DateTime requisicaoEntradaEm,
      String imgProjeto,
      Endereco endereco,
      bool aprovado,
      String? idPerfilResponsavel,
      DateTime? entradaEm,
      List<Curso> cursos) = _$_Projeto;

  factory _Projeto.fromJson(Map<String, dynamic> json) = _$_Projeto.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  int get telefone;
  @override
  DateTime get requisicaoEntradaEm;
  @override
  String get imgProjeto;
  @override
  Endereco get endereco;
  @override
  bool get aprovado;
  @override
  String? get idPerfilResponsavel;
  @override
  DateTime? get entradaEm;
  @override
  List<Curso> get cursos;
  @override
  @JsonKey(ignore: true)
  _$ProjetoCopyWith<_Projeto> get copyWith =>
      throw _privateConstructorUsedError;
}
