// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Perfil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Perfil _$PerfilFromJson(Map<String, dynamic> json) {
  return _Perfil.fromJson(json);
}

/// @nodoc
class _$PerfilTearOff {
  const _$PerfilTearOff();

  _Perfil call(
      String id,
      String email,
      String nome,
      int telefone,
      DateTime entradaEm,
      String fotoPerfil,
      RegraPerfil regra,
      String? cpf,
      PerfilAssociacoes? associacoes,
      InformacoesUniversitario? universitario) {
    return _Perfil(
      id,
      email,
      nome,
      telefone,
      entradaEm,
      fotoPerfil,
      regra,
      cpf,
      associacoes,
      universitario,
    );
  }

  Perfil fromJson(Map<String, Object?> json) {
    return Perfil.fromJson(json);
  }
}

/// @nodoc
const $Perfil = _$PerfilTearOff();

/// @nodoc
mixin _$Perfil {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  int get telefone => throw _privateConstructorUsedError;
  DateTime get entradaEm => throw _privateConstructorUsedError;
  String get fotoPerfil => throw _privateConstructorUsedError;
  RegraPerfil get regra => throw _privateConstructorUsedError;
  String? get cpf => throw _privateConstructorUsedError;
  PerfilAssociacoes? get associacoes => throw _privateConstructorUsedError;
  InformacoesUniversitario? get universitario =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerfilCopyWith<Perfil> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerfilCopyWith<$Res> {
  factory $PerfilCopyWith(Perfil value, $Res Function(Perfil) then) =
      _$PerfilCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String email,
      String nome,
      int telefone,
      DateTime entradaEm,
      String fotoPerfil,
      RegraPerfil regra,
      String? cpf,
      PerfilAssociacoes? associacoes,
      InformacoesUniversitario? universitario});

  $PerfilAssociacoesCopyWith<$Res>? get associacoes;
  $InformacoesUniversitarioCopyWith<$Res>? get universitario;
}

/// @nodoc
class _$PerfilCopyWithImpl<$Res> implements $PerfilCopyWith<$Res> {
  _$PerfilCopyWithImpl(this._value, this._then);

  final Perfil _value;
  // ignore: unused_field
  final $Res Function(Perfil) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? nome = freezed,
    Object? telefone = freezed,
    Object? entradaEm = freezed,
    Object? fotoPerfil = freezed,
    Object? regra = freezed,
    Object? cpf = freezed,
    Object? associacoes = freezed,
    Object? universitario = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefone: telefone == freezed
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as int,
      entradaEm: entradaEm == freezed
          ? _value.entradaEm
          : entradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fotoPerfil: fotoPerfil == freezed
          ? _value.fotoPerfil
          : fotoPerfil // ignore: cast_nullable_to_non_nullable
              as String,
      regra: regra == freezed
          ? _value.regra
          : regra // ignore: cast_nullable_to_non_nullable
              as RegraPerfil,
      cpf: cpf == freezed
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String?,
      associacoes: associacoes == freezed
          ? _value.associacoes
          : associacoes // ignore: cast_nullable_to_non_nullable
              as PerfilAssociacoes?,
      universitario: universitario == freezed
          ? _value.universitario
          : universitario // ignore: cast_nullable_to_non_nullable
              as InformacoesUniversitario?,
    ));
  }

  @override
  $PerfilAssociacoesCopyWith<$Res>? get associacoes {
    if (_value.associacoes == null) {
      return null;
    }

    return $PerfilAssociacoesCopyWith<$Res>(_value.associacoes!, (value) {
      return _then(_value.copyWith(associacoes: value));
    });
  }

  @override
  $InformacoesUniversitarioCopyWith<$Res>? get universitario {
    if (_value.universitario == null) {
      return null;
    }

    return $InformacoesUniversitarioCopyWith<$Res>(_value.universitario!,
        (value) {
      return _then(_value.copyWith(universitario: value));
    });
  }
}

/// @nodoc
abstract class _$PerfilCopyWith<$Res> implements $PerfilCopyWith<$Res> {
  factory _$PerfilCopyWith(_Perfil value, $Res Function(_Perfil) then) =
      __$PerfilCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String email,
      String nome,
      int telefone,
      DateTime entradaEm,
      String fotoPerfil,
      RegraPerfil regra,
      String? cpf,
      PerfilAssociacoes? associacoes,
      InformacoesUniversitario? universitario});

  @override
  $PerfilAssociacoesCopyWith<$Res>? get associacoes;
  @override
  $InformacoesUniversitarioCopyWith<$Res>? get universitario;
}

/// @nodoc
class __$PerfilCopyWithImpl<$Res> extends _$PerfilCopyWithImpl<$Res>
    implements _$PerfilCopyWith<$Res> {
  __$PerfilCopyWithImpl(_Perfil _value, $Res Function(_Perfil) _then)
      : super(_value, (v) => _then(v as _Perfil));

  @override
  _Perfil get _value => super._value as _Perfil;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? nome = freezed,
    Object? telefone = freezed,
    Object? entradaEm = freezed,
    Object? fotoPerfil = freezed,
    Object? regra = freezed,
    Object? cpf = freezed,
    Object? associacoes = freezed,
    Object? universitario = freezed,
  }) {
    return _then(_Perfil(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      telefone == freezed
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as int,
      entradaEm == freezed
          ? _value.entradaEm
          : entradaEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fotoPerfil == freezed
          ? _value.fotoPerfil
          : fotoPerfil // ignore: cast_nullable_to_non_nullable
              as String,
      regra == freezed
          ? _value.regra
          : regra // ignore: cast_nullable_to_non_nullable
              as RegraPerfil,
      cpf == freezed
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String?,
      associacoes == freezed
          ? _value.associacoes
          : associacoes // ignore: cast_nullable_to_non_nullable
              as PerfilAssociacoes?,
      universitario == freezed
          ? _value.universitario
          : universitario // ignore: cast_nullable_to_non_nullable
              as InformacoesUniversitario?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Perfil implements _Perfil {
  const _$_Perfil(
      this.id,
      this.email,
      this.nome,
      this.telefone,
      this.entradaEm,
      this.fotoPerfil,
      this.regra,
      this.cpf,
      this.associacoes,
      this.universitario);

  factory _$_Perfil.fromJson(Map<String, dynamic> json) =>
      _$$_PerfilFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String nome;
  @override
  final int telefone;
  @override
  final DateTime entradaEm;
  @override
  final String fotoPerfil;
  @override
  final RegraPerfil regra;
  @override
  final String? cpf;
  @override
  final PerfilAssociacoes? associacoes;
  @override
  final InformacoesUniversitario? universitario;

  @override
  String toString() {
    return 'Perfil(id: $id, email: $email, nome: $nome, telefone: $telefone, entradaEm: $entradaEm, fotoPerfil: $fotoPerfil, regra: $regra, cpf: $cpf, associacoes: $associacoes, universitario: $universitario)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Perfil &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.nome, nome) &&
            const DeepCollectionEquality().equals(other.telefone, telefone) &&
            const DeepCollectionEquality().equals(other.entradaEm, entradaEm) &&
            const DeepCollectionEquality()
                .equals(other.fotoPerfil, fotoPerfil) &&
            const DeepCollectionEquality().equals(other.regra, regra) &&
            const DeepCollectionEquality().equals(other.cpf, cpf) &&
            const DeepCollectionEquality()
                .equals(other.associacoes, associacoes) &&
            const DeepCollectionEquality()
                .equals(other.universitario, universitario));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(nome),
      const DeepCollectionEquality().hash(telefone),
      const DeepCollectionEquality().hash(entradaEm),
      const DeepCollectionEquality().hash(fotoPerfil),
      const DeepCollectionEquality().hash(regra),
      const DeepCollectionEquality().hash(cpf),
      const DeepCollectionEquality().hash(associacoes),
      const DeepCollectionEquality().hash(universitario));

  @JsonKey(ignore: true)
  @override
  _$PerfilCopyWith<_Perfil> get copyWith =>
      __$PerfilCopyWithImpl<_Perfil>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PerfilToJson(this);
  }
}

abstract class _Perfil implements Perfil {
  const factory _Perfil(
      String id,
      String email,
      String nome,
      int telefone,
      DateTime entradaEm,
      String fotoPerfil,
      RegraPerfil regra,
      String? cpf,
      PerfilAssociacoes? associacoes,
      InformacoesUniversitario? universitario) = _$_Perfil;

  factory _Perfil.fromJson(Map<String, dynamic> json) = _$_Perfil.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get nome;
  @override
  int get telefone;
  @override
  DateTime get entradaEm;
  @override
  String get fotoPerfil;
  @override
  RegraPerfil get regra;
  @override
  String? get cpf;
  @override
  PerfilAssociacoes? get associacoes;
  @override
  InformacoesUniversitario? get universitario;
  @override
  @JsonKey(ignore: true)
  _$PerfilCopyWith<_Perfil> get copyWith => throw _privateConstructorUsedError;
}

PerfilAssociacoes _$PerfilAssociacoesFromJson(Map<String, dynamic> json) {
  return _PerfilAssociacoes.fromJson(json);
}

/// @nodoc
class _$PerfilAssociacoesTearOff {
  const _$PerfilAssociacoesTearOff();

  _PerfilAssociacoes call(
      InformacoesCurso aluno, InformacoesProfessor professor) {
    return _PerfilAssociacoes(
      aluno,
      professor,
    );
  }

  PerfilAssociacoes fromJson(Map<String, Object?> json) {
    return PerfilAssociacoes.fromJson(json);
  }
}

/// @nodoc
const $PerfilAssociacoes = _$PerfilAssociacoesTearOff();

/// @nodoc
mixin _$PerfilAssociacoes {
  InformacoesCurso get aluno => throw _privateConstructorUsedError;
  InformacoesProfessor get professor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerfilAssociacoesCopyWith<PerfilAssociacoes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerfilAssociacoesCopyWith<$Res> {
  factory $PerfilAssociacoesCopyWith(
          PerfilAssociacoes value, $Res Function(PerfilAssociacoes) then) =
      _$PerfilAssociacoesCopyWithImpl<$Res>;
  $Res call({InformacoesCurso aluno, InformacoesProfessor professor});

  $InformacoesCursoCopyWith<$Res> get aluno;
  $InformacoesProfessorCopyWith<$Res> get professor;
}

/// @nodoc
class _$PerfilAssociacoesCopyWithImpl<$Res>
    implements $PerfilAssociacoesCopyWith<$Res> {
  _$PerfilAssociacoesCopyWithImpl(this._value, this._then);

  final PerfilAssociacoes _value;
  // ignore: unused_field
  final $Res Function(PerfilAssociacoes) _then;

  @override
  $Res call({
    Object? aluno = freezed,
    Object? professor = freezed,
  }) {
    return _then(_value.copyWith(
      aluno: aluno == freezed
          ? _value.aluno
          : aluno // ignore: cast_nullable_to_non_nullable
              as InformacoesCurso,
      professor: professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as InformacoesProfessor,
    ));
  }

  @override
  $InformacoesCursoCopyWith<$Res> get aluno {
    return $InformacoesCursoCopyWith<$Res>(_value.aluno, (value) {
      return _then(_value.copyWith(aluno: value));
    });
  }

  @override
  $InformacoesProfessorCopyWith<$Res> get professor {
    return $InformacoesProfessorCopyWith<$Res>(_value.professor, (value) {
      return _then(_value.copyWith(professor: value));
    });
  }
}

/// @nodoc
abstract class _$PerfilAssociacoesCopyWith<$Res>
    implements $PerfilAssociacoesCopyWith<$Res> {
  factory _$PerfilAssociacoesCopyWith(
          _PerfilAssociacoes value, $Res Function(_PerfilAssociacoes) then) =
      __$PerfilAssociacoesCopyWithImpl<$Res>;
  @override
  $Res call({InformacoesCurso aluno, InformacoesProfessor professor});

  @override
  $InformacoesCursoCopyWith<$Res> get aluno;
  @override
  $InformacoesProfessorCopyWith<$Res> get professor;
}

/// @nodoc
class __$PerfilAssociacoesCopyWithImpl<$Res>
    extends _$PerfilAssociacoesCopyWithImpl<$Res>
    implements _$PerfilAssociacoesCopyWith<$Res> {
  __$PerfilAssociacoesCopyWithImpl(
      _PerfilAssociacoes _value, $Res Function(_PerfilAssociacoes) _then)
      : super(_value, (v) => _then(v as _PerfilAssociacoes));

  @override
  _PerfilAssociacoes get _value => super._value as _PerfilAssociacoes;

  @override
  $Res call({
    Object? aluno = freezed,
    Object? professor = freezed,
  }) {
    return _then(_PerfilAssociacoes(
      aluno == freezed
          ? _value.aluno
          : aluno // ignore: cast_nullable_to_non_nullable
              as InformacoesCurso,
      professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as InformacoesProfessor,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PerfilAssociacoes implements _PerfilAssociacoes {
  const _$_PerfilAssociacoes(this.aluno, this.professor);

  factory _$_PerfilAssociacoes.fromJson(Map<String, dynamic> json) =>
      _$$_PerfilAssociacoesFromJson(json);

  @override
  final InformacoesCurso aluno;
  @override
  final InformacoesProfessor professor;

  @override
  String toString() {
    return 'PerfilAssociacoes(aluno: $aluno, professor: $professor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PerfilAssociacoes &&
            const DeepCollectionEquality().equals(other.aluno, aluno) &&
            const DeepCollectionEquality().equals(other.professor, professor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(aluno),
      const DeepCollectionEquality().hash(professor));

  @JsonKey(ignore: true)
  @override
  _$PerfilAssociacoesCopyWith<_PerfilAssociacoes> get copyWith =>
      __$PerfilAssociacoesCopyWithImpl<_PerfilAssociacoes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PerfilAssociacoesToJson(this);
  }
}

abstract class _PerfilAssociacoes implements PerfilAssociacoes {
  const factory _PerfilAssociacoes(
          InformacoesCurso aluno, InformacoesProfessor professor) =
      _$_PerfilAssociacoes;

  factory _PerfilAssociacoes.fromJson(Map<String, dynamic> json) =
      _$_PerfilAssociacoes.fromJson;

  @override
  InformacoesCurso get aluno;
  @override
  InformacoesProfessor get professor;
  @override
  @JsonKey(ignore: true)
  _$PerfilAssociacoesCopyWith<_PerfilAssociacoes> get copyWith =>
      throw _privateConstructorUsedError;
}

InformacoesCurso _$InformacoesCursoFromJson(Map<String, dynamic> json) {
  return _InformacoesCurso.fromJson(json);
}

/// @nodoc
class _$InformacoesCursoTearOff {
  const _$InformacoesCursoTearOff();

  _InformacoesCurso call(bool alunoParceiro, List<Curso>? cursos) {
    return _InformacoesCurso(
      alunoParceiro,
      cursos,
    );
  }

  InformacoesCurso fromJson(Map<String, Object?> json) {
    return InformacoesCurso.fromJson(json);
  }
}

/// @nodoc
const $InformacoesCurso = _$InformacoesCursoTearOff();

/// @nodoc
mixin _$InformacoesCurso {
  bool get alunoParceiro => throw _privateConstructorUsedError;
  List<Curso>? get cursos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformacoesCursoCopyWith<InformacoesCurso> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformacoesCursoCopyWith<$Res> {
  factory $InformacoesCursoCopyWith(
          InformacoesCurso value, $Res Function(InformacoesCurso) then) =
      _$InformacoesCursoCopyWithImpl<$Res>;
  $Res call({bool alunoParceiro, List<Curso>? cursos});
}

/// @nodoc
class _$InformacoesCursoCopyWithImpl<$Res>
    implements $InformacoesCursoCopyWith<$Res> {
  _$InformacoesCursoCopyWithImpl(this._value, this._then);

  final InformacoesCurso _value;
  // ignore: unused_field
  final $Res Function(InformacoesCurso) _then;

  @override
  $Res call({
    Object? alunoParceiro = freezed,
    Object? cursos = freezed,
  }) {
    return _then(_value.copyWith(
      alunoParceiro: alunoParceiro == freezed
          ? _value.alunoParceiro
          : alunoParceiro // ignore: cast_nullable_to_non_nullable
              as bool,
      cursos: cursos == freezed
          ? _value.cursos
          : cursos // ignore: cast_nullable_to_non_nullable
              as List<Curso>?,
    ));
  }
}

/// @nodoc
abstract class _$InformacoesCursoCopyWith<$Res>
    implements $InformacoesCursoCopyWith<$Res> {
  factory _$InformacoesCursoCopyWith(
          _InformacoesCurso value, $Res Function(_InformacoesCurso) then) =
      __$InformacoesCursoCopyWithImpl<$Res>;
  @override
  $Res call({bool alunoParceiro, List<Curso>? cursos});
}

/// @nodoc
class __$InformacoesCursoCopyWithImpl<$Res>
    extends _$InformacoesCursoCopyWithImpl<$Res>
    implements _$InformacoesCursoCopyWith<$Res> {
  __$InformacoesCursoCopyWithImpl(
      _InformacoesCurso _value, $Res Function(_InformacoesCurso) _then)
      : super(_value, (v) => _then(v as _InformacoesCurso));

  @override
  _InformacoesCurso get _value => super._value as _InformacoesCurso;

  @override
  $Res call({
    Object? alunoParceiro = freezed,
    Object? cursos = freezed,
  }) {
    return _then(_InformacoesCurso(
      alunoParceiro == freezed
          ? _value.alunoParceiro
          : alunoParceiro // ignore: cast_nullable_to_non_nullable
              as bool,
      cursos == freezed
          ? _value.cursos
          : cursos // ignore: cast_nullable_to_non_nullable
              as List<Curso>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InformacoesCurso implements _InformacoesCurso {
  const _$_InformacoesCurso(this.alunoParceiro, this.cursos);

  factory _$_InformacoesCurso.fromJson(Map<String, dynamic> json) =>
      _$$_InformacoesCursoFromJson(json);

  @override
  final bool alunoParceiro;
  @override
  final List<Curso>? cursos;

  @override
  String toString() {
    return 'InformacoesCurso(alunoParceiro: $alunoParceiro, cursos: $cursos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InformacoesCurso &&
            const DeepCollectionEquality()
                .equals(other.alunoParceiro, alunoParceiro) &&
            const DeepCollectionEquality().equals(other.cursos, cursos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(alunoParceiro),
      const DeepCollectionEquality().hash(cursos));

  @JsonKey(ignore: true)
  @override
  _$InformacoesCursoCopyWith<_InformacoesCurso> get copyWith =>
      __$InformacoesCursoCopyWithImpl<_InformacoesCurso>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InformacoesCursoToJson(this);
  }
}

abstract class _InformacoesCurso implements InformacoesCurso {
  const factory _InformacoesCurso(bool alunoParceiro, List<Curso>? cursos) =
      _$_InformacoesCurso;

  factory _InformacoesCurso.fromJson(Map<String, dynamic> json) =
      _$_InformacoesCurso.fromJson;

  @override
  bool get alunoParceiro;
  @override
  List<Curso>? get cursos;
  @override
  @JsonKey(ignore: true)
  _$InformacoesCursoCopyWith<_InformacoesCurso> get copyWith =>
      throw _privateConstructorUsedError;
}

InformacoesProfessor _$InformacoesProfessorFromJson(Map<String, dynamic> json) {
  return _InformacoesProfessor.fromJson(json);
}

/// @nodoc
class _$InformacoesProfessorTearOff {
  const _$InformacoesProfessorTearOff();

  _InformacoesProfessor call(bool professor, List<Materia>? materiasProfessor) {
    return _InformacoesProfessor(
      professor,
      materiasProfessor,
    );
  }

  InformacoesProfessor fromJson(Map<String, Object?> json) {
    return InformacoesProfessor.fromJson(json);
  }
}

/// @nodoc
const $InformacoesProfessor = _$InformacoesProfessorTearOff();

/// @nodoc
mixin _$InformacoesProfessor {
  bool get professor => throw _privateConstructorUsedError;
  List<Materia>? get materiasProfessor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformacoesProfessorCopyWith<InformacoesProfessor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformacoesProfessorCopyWith<$Res> {
  factory $InformacoesProfessorCopyWith(InformacoesProfessor value,
          $Res Function(InformacoesProfessor) then) =
      _$InformacoesProfessorCopyWithImpl<$Res>;
  $Res call({bool professor, List<Materia>? materiasProfessor});
}

/// @nodoc
class _$InformacoesProfessorCopyWithImpl<$Res>
    implements $InformacoesProfessorCopyWith<$Res> {
  _$InformacoesProfessorCopyWithImpl(this._value, this._then);

  final InformacoesProfessor _value;
  // ignore: unused_field
  final $Res Function(InformacoesProfessor) _then;

  @override
  $Res call({
    Object? professor = freezed,
    Object? materiasProfessor = freezed,
  }) {
    return _then(_value.copyWith(
      professor: professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as bool,
      materiasProfessor: materiasProfessor == freezed
          ? _value.materiasProfessor
          : materiasProfessor // ignore: cast_nullable_to_non_nullable
              as List<Materia>?,
    ));
  }
}

/// @nodoc
abstract class _$InformacoesProfessorCopyWith<$Res>
    implements $InformacoesProfessorCopyWith<$Res> {
  factory _$InformacoesProfessorCopyWith(_InformacoesProfessor value,
          $Res Function(_InformacoesProfessor) then) =
      __$InformacoesProfessorCopyWithImpl<$Res>;
  @override
  $Res call({bool professor, List<Materia>? materiasProfessor});
}

/// @nodoc
class __$InformacoesProfessorCopyWithImpl<$Res>
    extends _$InformacoesProfessorCopyWithImpl<$Res>
    implements _$InformacoesProfessorCopyWith<$Res> {
  __$InformacoesProfessorCopyWithImpl(
      _InformacoesProfessor _value, $Res Function(_InformacoesProfessor) _then)
      : super(_value, (v) => _then(v as _InformacoesProfessor));

  @override
  _InformacoesProfessor get _value => super._value as _InformacoesProfessor;

  @override
  $Res call({
    Object? professor = freezed,
    Object? materiasProfessor = freezed,
  }) {
    return _then(_InformacoesProfessor(
      professor == freezed
          ? _value.professor
          : professor // ignore: cast_nullable_to_non_nullable
              as bool,
      materiasProfessor == freezed
          ? _value.materiasProfessor
          : materiasProfessor // ignore: cast_nullable_to_non_nullable
              as List<Materia>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InformacoesProfessor implements _InformacoesProfessor {
  const _$_InformacoesProfessor(this.professor, this.materiasProfessor);

  factory _$_InformacoesProfessor.fromJson(Map<String, dynamic> json) =>
      _$$_InformacoesProfessorFromJson(json);

  @override
  final bool professor;
  @override
  final List<Materia>? materiasProfessor;

  @override
  String toString() {
    return 'InformacoesProfessor(professor: $professor, materiasProfessor: $materiasProfessor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InformacoesProfessor &&
            const DeepCollectionEquality().equals(other.professor, professor) &&
            const DeepCollectionEquality()
                .equals(other.materiasProfessor, materiasProfessor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(professor),
      const DeepCollectionEquality().hash(materiasProfessor));

  @JsonKey(ignore: true)
  @override
  _$InformacoesProfessorCopyWith<_InformacoesProfessor> get copyWith =>
      __$InformacoesProfessorCopyWithImpl<_InformacoesProfessor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InformacoesProfessorToJson(this);
  }
}

abstract class _InformacoesProfessor implements InformacoesProfessor {
  const factory _InformacoesProfessor(
          bool professor, List<Materia>? materiasProfessor) =
      _$_InformacoesProfessor;

  factory _InformacoesProfessor.fromJson(Map<String, dynamic> json) =
      _$_InformacoesProfessor.fromJson;

  @override
  bool get professor;
  @override
  List<Materia>? get materiasProfessor;
  @override
  @JsonKey(ignore: true)
  _$InformacoesProfessorCopyWith<_InformacoesProfessor> get copyWith =>
      throw _privateConstructorUsedError;
}

InformacoesUniversitario _$InformacoesUniversitarioFromJson(
    Map<String, dynamic> json) {
  return _InformacoesUniversitario.fromJson(json);
}

/// @nodoc
class _$InformacoesUniversitarioTearOff {
  const _$InformacoesUniversitarioTearOff();

  _InformacoesUniversitario call(
      bool universitario,
      String? email,
      InformacoesUniversitarioGraduacao? graduacao,
      List<ColaboracaoAtividade>? atividadesQueColaborou) {
    return _InformacoesUniversitario(
      universitario,
      email,
      graduacao,
      atividadesQueColaborou,
    );
  }

  InformacoesUniversitario fromJson(Map<String, Object?> json) {
    return InformacoesUniversitario.fromJson(json);
  }
}

/// @nodoc
const $InformacoesUniversitario = _$InformacoesUniversitarioTearOff();

/// @nodoc
mixin _$InformacoesUniversitario {
  bool get universitario => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  InformacoesUniversitarioGraduacao? get graduacao =>
      throw _privateConstructorUsedError;
  List<ColaboracaoAtividade>? get atividadesQueColaborou =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformacoesUniversitarioCopyWith<InformacoesUniversitario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformacoesUniversitarioCopyWith<$Res> {
  factory $InformacoesUniversitarioCopyWith(InformacoesUniversitario value,
          $Res Function(InformacoesUniversitario) then) =
      _$InformacoesUniversitarioCopyWithImpl<$Res>;
  $Res call(
      {bool universitario,
      String? email,
      InformacoesUniversitarioGraduacao? graduacao,
      List<ColaboracaoAtividade>? atividadesQueColaborou});

  $InformacoesUniversitarioGraduacaoCopyWith<$Res>? get graduacao;
}

/// @nodoc
class _$InformacoesUniversitarioCopyWithImpl<$Res>
    implements $InformacoesUniversitarioCopyWith<$Res> {
  _$InformacoesUniversitarioCopyWithImpl(this._value, this._then);

  final InformacoesUniversitario _value;
  // ignore: unused_field
  final $Res Function(InformacoesUniversitario) _then;

  @override
  $Res call({
    Object? universitario = freezed,
    Object? email = freezed,
    Object? graduacao = freezed,
    Object? atividadesQueColaborou = freezed,
  }) {
    return _then(_value.copyWith(
      universitario: universitario == freezed
          ? _value.universitario
          : universitario // ignore: cast_nullable_to_non_nullable
              as bool,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      graduacao: graduacao == freezed
          ? _value.graduacao
          : graduacao // ignore: cast_nullable_to_non_nullable
              as InformacoesUniversitarioGraduacao?,
      atividadesQueColaborou: atividadesQueColaborou == freezed
          ? _value.atividadesQueColaborou
          : atividadesQueColaborou // ignore: cast_nullable_to_non_nullable
              as List<ColaboracaoAtividade>?,
    ));
  }

  @override
  $InformacoesUniversitarioGraduacaoCopyWith<$Res>? get graduacao {
    if (_value.graduacao == null) {
      return null;
    }

    return $InformacoesUniversitarioGraduacaoCopyWith<$Res>(_value.graduacao!,
        (value) {
      return _then(_value.copyWith(graduacao: value));
    });
  }
}

/// @nodoc
abstract class _$InformacoesUniversitarioCopyWith<$Res>
    implements $InformacoesUniversitarioCopyWith<$Res> {
  factory _$InformacoesUniversitarioCopyWith(_InformacoesUniversitario value,
          $Res Function(_InformacoesUniversitario) then) =
      __$InformacoesUniversitarioCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool universitario,
      String? email,
      InformacoesUniversitarioGraduacao? graduacao,
      List<ColaboracaoAtividade>? atividadesQueColaborou});

  @override
  $InformacoesUniversitarioGraduacaoCopyWith<$Res>? get graduacao;
}

/// @nodoc
class __$InformacoesUniversitarioCopyWithImpl<$Res>
    extends _$InformacoesUniversitarioCopyWithImpl<$Res>
    implements _$InformacoesUniversitarioCopyWith<$Res> {
  __$InformacoesUniversitarioCopyWithImpl(_InformacoesUniversitario _value,
      $Res Function(_InformacoesUniversitario) _then)
      : super(_value, (v) => _then(v as _InformacoesUniversitario));

  @override
  _InformacoesUniversitario get _value =>
      super._value as _InformacoesUniversitario;

  @override
  $Res call({
    Object? universitario = freezed,
    Object? email = freezed,
    Object? graduacao = freezed,
    Object? atividadesQueColaborou = freezed,
  }) {
    return _then(_InformacoesUniversitario(
      universitario == freezed
          ? _value.universitario
          : universitario // ignore: cast_nullable_to_non_nullable
              as bool,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      graduacao == freezed
          ? _value.graduacao
          : graduacao // ignore: cast_nullable_to_non_nullable
              as InformacoesUniversitarioGraduacao?,
      atividadesQueColaborou == freezed
          ? _value.atividadesQueColaborou
          : atividadesQueColaborou // ignore: cast_nullable_to_non_nullable
              as List<ColaboracaoAtividade>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InformacoesUniversitario implements _InformacoesUniversitario {
  const _$_InformacoesUniversitario(this.universitario, this.email,
      this.graduacao, this.atividadesQueColaborou);

  factory _$_InformacoesUniversitario.fromJson(Map<String, dynamic> json) =>
      _$$_InformacoesUniversitarioFromJson(json);

  @override
  final bool universitario;
  @override
  final String? email;
  @override
  final InformacoesUniversitarioGraduacao? graduacao;
  @override
  final List<ColaboracaoAtividade>? atividadesQueColaborou;

  @override
  String toString() {
    return 'InformacoesUniversitario(universitario: $universitario, email: $email, graduacao: $graduacao, atividadesQueColaborou: $atividadesQueColaborou)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InformacoesUniversitario &&
            const DeepCollectionEquality()
                .equals(other.universitario, universitario) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.graduacao, graduacao) &&
            const DeepCollectionEquality()
                .equals(other.atividadesQueColaborou, atividadesQueColaborou));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(universitario),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(graduacao),
      const DeepCollectionEquality().hash(atividadesQueColaborou));

  @JsonKey(ignore: true)
  @override
  _$InformacoesUniversitarioCopyWith<_InformacoesUniversitario> get copyWith =>
      __$InformacoesUniversitarioCopyWithImpl<_InformacoesUniversitario>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InformacoesUniversitarioToJson(this);
  }
}

abstract class _InformacoesUniversitario implements InformacoesUniversitario {
  const factory _InformacoesUniversitario(
          bool universitario,
          String? email,
          InformacoesUniversitarioGraduacao? graduacao,
          List<ColaboracaoAtividade>? atividadesQueColaborou) =
      _$_InformacoesUniversitario;

  factory _InformacoesUniversitario.fromJson(Map<String, dynamic> json) =
      _$_InformacoesUniversitario.fromJson;

  @override
  bool get universitario;
  @override
  String? get email;
  @override
  InformacoesUniversitarioGraduacao? get graduacao;
  @override
  List<ColaboracaoAtividade>? get atividadesQueColaborou;
  @override
  @JsonKey(ignore: true)
  _$InformacoesUniversitarioCopyWith<_InformacoesUniversitario> get copyWith =>
      throw _privateConstructorUsedError;
}

InformacoesUniversitarioGraduacao _$InformacoesUniversitarioGraduacaoFromJson(
    Map<String, dynamic> json) {
  return _InformacoesUniversitarioGraduacao.fromJson(json);
}

/// @nodoc
class _$InformacoesUniversitarioGraduacaoTearOff {
  const _$InformacoesUniversitarioGraduacaoTearOff();

  _InformacoesUniversitarioGraduacao call(
      DateTime atualizadoEm, CursoUniversitario curso) {
    return _InformacoesUniversitarioGraduacao(
      atualizadoEm,
      curso,
    );
  }

  InformacoesUniversitarioGraduacao fromJson(Map<String, Object?> json) {
    return InformacoesUniversitarioGraduacao.fromJson(json);
  }
}

/// @nodoc
const $InformacoesUniversitarioGraduacao =
    _$InformacoesUniversitarioGraduacaoTearOff();

/// @nodoc
mixin _$InformacoesUniversitarioGraduacao {
  DateTime get atualizadoEm => throw _privateConstructorUsedError;
  CursoUniversitario get curso => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformacoesUniversitarioGraduacaoCopyWith<InformacoesUniversitarioGraduacao>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformacoesUniversitarioGraduacaoCopyWith<$Res> {
  factory $InformacoesUniversitarioGraduacaoCopyWith(
          InformacoesUniversitarioGraduacao value,
          $Res Function(InformacoesUniversitarioGraduacao) then) =
      _$InformacoesUniversitarioGraduacaoCopyWithImpl<$Res>;
  $Res call({DateTime atualizadoEm, CursoUniversitario curso});

  $CursoUniversitarioCopyWith<$Res> get curso;
}

/// @nodoc
class _$InformacoesUniversitarioGraduacaoCopyWithImpl<$Res>
    implements $InformacoesUniversitarioGraduacaoCopyWith<$Res> {
  _$InformacoesUniversitarioGraduacaoCopyWithImpl(this._value, this._then);

  final InformacoesUniversitarioGraduacao _value;
  // ignore: unused_field
  final $Res Function(InformacoesUniversitarioGraduacao) _then;

  @override
  $Res call({
    Object? atualizadoEm = freezed,
    Object? curso = freezed,
  }) {
    return _then(_value.copyWith(
      atualizadoEm: atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      curso: curso == freezed
          ? _value.curso
          : curso // ignore: cast_nullable_to_non_nullable
              as CursoUniversitario,
    ));
  }

  @override
  $CursoUniversitarioCopyWith<$Res> get curso {
    return $CursoUniversitarioCopyWith<$Res>(_value.curso, (value) {
      return _then(_value.copyWith(curso: value));
    });
  }
}

/// @nodoc
abstract class _$InformacoesUniversitarioGraduacaoCopyWith<$Res>
    implements $InformacoesUniversitarioGraduacaoCopyWith<$Res> {
  factory _$InformacoesUniversitarioGraduacaoCopyWith(
          _InformacoesUniversitarioGraduacao value,
          $Res Function(_InformacoesUniversitarioGraduacao) then) =
      __$InformacoesUniversitarioGraduacaoCopyWithImpl<$Res>;
  @override
  $Res call({DateTime atualizadoEm, CursoUniversitario curso});

  @override
  $CursoUniversitarioCopyWith<$Res> get curso;
}

/// @nodoc
class __$InformacoesUniversitarioGraduacaoCopyWithImpl<$Res>
    extends _$InformacoesUniversitarioGraduacaoCopyWithImpl<$Res>
    implements _$InformacoesUniversitarioGraduacaoCopyWith<$Res> {
  __$InformacoesUniversitarioGraduacaoCopyWithImpl(
      _InformacoesUniversitarioGraduacao _value,
      $Res Function(_InformacoesUniversitarioGraduacao) _then)
      : super(_value, (v) => _then(v as _InformacoesUniversitarioGraduacao));

  @override
  _InformacoesUniversitarioGraduacao get _value =>
      super._value as _InformacoesUniversitarioGraduacao;

  @override
  $Res call({
    Object? atualizadoEm = freezed,
    Object? curso = freezed,
  }) {
    return _then(_InformacoesUniversitarioGraduacao(
      atualizadoEm == freezed
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      curso == freezed
          ? _value.curso
          : curso // ignore: cast_nullable_to_non_nullable
              as CursoUniversitario,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InformacoesUniversitarioGraduacao
    implements _InformacoesUniversitarioGraduacao {
  const _$_InformacoesUniversitarioGraduacao(this.atualizadoEm, this.curso);

  factory _$_InformacoesUniversitarioGraduacao.fromJson(
          Map<String, dynamic> json) =>
      _$$_InformacoesUniversitarioGraduacaoFromJson(json);

  @override
  final DateTime atualizadoEm;
  @override
  final CursoUniversitario curso;

  @override
  String toString() {
    return 'InformacoesUniversitarioGraduacao(atualizadoEm: $atualizadoEm, curso: $curso)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InformacoesUniversitarioGraduacao &&
            const DeepCollectionEquality()
                .equals(other.atualizadoEm, atualizadoEm) &&
            const DeepCollectionEquality().equals(other.curso, curso));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(atualizadoEm),
      const DeepCollectionEquality().hash(curso));

  @JsonKey(ignore: true)
  @override
  _$InformacoesUniversitarioGraduacaoCopyWith<
          _InformacoesUniversitarioGraduacao>
      get copyWith => __$InformacoesUniversitarioGraduacaoCopyWithImpl<
          _InformacoesUniversitarioGraduacao>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InformacoesUniversitarioGraduacaoToJson(this);
  }
}

abstract class _InformacoesUniversitarioGraduacao
    implements InformacoesUniversitarioGraduacao {
  const factory _InformacoesUniversitarioGraduacao(
          DateTime atualizadoEm, CursoUniversitario curso) =
      _$_InformacoesUniversitarioGraduacao;

  factory _InformacoesUniversitarioGraduacao.fromJson(
          Map<String, dynamic> json) =
      _$_InformacoesUniversitarioGraduacao.fromJson;

  @override
  DateTime get atualizadoEm;
  @override
  CursoUniversitario get curso;
  @override
  @JsonKey(ignore: true)
  _$InformacoesUniversitarioGraduacaoCopyWith<
          _InformacoesUniversitarioGraduacao>
      get copyWith => throw _privateConstructorUsedError;
}

ColaboracaoAtividade _$ColaboracaoAtividadeFromJson(Map<String, dynamic> json) {
  return _ColaboracaoAtividade.fromJson(json);
}

/// @nodoc
class _$ColaboracaoAtividadeTearOff {
  const _$ColaboracaoAtividadeTearOff();

  _ColaboracaoAtividade call(String idResposta, String idAtividade,
      double horas, bool aprovado, bool? horasEmitidas) {
    return _ColaboracaoAtividade(
      idResposta,
      idAtividade,
      horas,
      aprovado,
      horasEmitidas,
    );
  }

  ColaboracaoAtividade fromJson(Map<String, Object?> json) {
    return ColaboracaoAtividade.fromJson(json);
  }
}

/// @nodoc
const $ColaboracaoAtividade = _$ColaboracaoAtividadeTearOff();

/// @nodoc
mixin _$ColaboracaoAtividade {
  String get idResposta => throw _privateConstructorUsedError;
  String get idAtividade => throw _privateConstructorUsedError;
  double get horas => throw _privateConstructorUsedError;
  bool get aprovado => throw _privateConstructorUsedError;
  bool? get horasEmitidas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColaboracaoAtividadeCopyWith<ColaboracaoAtividade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColaboracaoAtividadeCopyWith<$Res> {
  factory $ColaboracaoAtividadeCopyWith(ColaboracaoAtividade value,
          $Res Function(ColaboracaoAtividade) then) =
      _$ColaboracaoAtividadeCopyWithImpl<$Res>;
  $Res call(
      {String idResposta,
      String idAtividade,
      double horas,
      bool aprovado,
      bool? horasEmitidas});
}

/// @nodoc
class _$ColaboracaoAtividadeCopyWithImpl<$Res>
    implements $ColaboracaoAtividadeCopyWith<$Res> {
  _$ColaboracaoAtividadeCopyWithImpl(this._value, this._then);

  final ColaboracaoAtividade _value;
  // ignore: unused_field
  final $Res Function(ColaboracaoAtividade) _then;

  @override
  $Res call({
    Object? idResposta = freezed,
    Object? idAtividade = freezed,
    Object? horas = freezed,
    Object? aprovado = freezed,
    Object? horasEmitidas = freezed,
  }) {
    return _then(_value.copyWith(
      idResposta: idResposta == freezed
          ? _value.idResposta
          : idResposta // ignore: cast_nullable_to_non_nullable
              as String,
      idAtividade: idAtividade == freezed
          ? _value.idAtividade
          : idAtividade // ignore: cast_nullable_to_non_nullable
              as String,
      horas: horas == freezed
          ? _value.horas
          : horas // ignore: cast_nullable_to_non_nullable
              as double,
      aprovado: aprovado == freezed
          ? _value.aprovado
          : aprovado // ignore: cast_nullable_to_non_nullable
              as bool,
      horasEmitidas: horasEmitidas == freezed
          ? _value.horasEmitidas
          : horasEmitidas // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ColaboracaoAtividadeCopyWith<$Res>
    implements $ColaboracaoAtividadeCopyWith<$Res> {
  factory _$ColaboracaoAtividadeCopyWith(_ColaboracaoAtividade value,
          $Res Function(_ColaboracaoAtividade) then) =
      __$ColaboracaoAtividadeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idResposta,
      String idAtividade,
      double horas,
      bool aprovado,
      bool? horasEmitidas});
}

/// @nodoc
class __$ColaboracaoAtividadeCopyWithImpl<$Res>
    extends _$ColaboracaoAtividadeCopyWithImpl<$Res>
    implements _$ColaboracaoAtividadeCopyWith<$Res> {
  __$ColaboracaoAtividadeCopyWithImpl(
      _ColaboracaoAtividade _value, $Res Function(_ColaboracaoAtividade) _then)
      : super(_value, (v) => _then(v as _ColaboracaoAtividade));

  @override
  _ColaboracaoAtividade get _value => super._value as _ColaboracaoAtividade;

  @override
  $Res call({
    Object? idResposta = freezed,
    Object? idAtividade = freezed,
    Object? horas = freezed,
    Object? aprovado = freezed,
    Object? horasEmitidas = freezed,
  }) {
    return _then(_ColaboracaoAtividade(
      idResposta == freezed
          ? _value.idResposta
          : idResposta // ignore: cast_nullable_to_non_nullable
              as String,
      idAtividade == freezed
          ? _value.idAtividade
          : idAtividade // ignore: cast_nullable_to_non_nullable
              as String,
      horas == freezed
          ? _value.horas
          : horas // ignore: cast_nullable_to_non_nullable
              as double,
      aprovado == freezed
          ? _value.aprovado
          : aprovado // ignore: cast_nullable_to_non_nullable
              as bool,
      horasEmitidas == freezed
          ? _value.horasEmitidas
          : horasEmitidas // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ColaboracaoAtividade implements _ColaboracaoAtividade {
  const _$_ColaboracaoAtividade(this.idResposta, this.idAtividade, this.horas,
      this.aprovado, this.horasEmitidas);

  factory _$_ColaboracaoAtividade.fromJson(Map<String, dynamic> json) =>
      _$$_ColaboracaoAtividadeFromJson(json);

  @override
  final String idResposta;
  @override
  final String idAtividade;
  @override
  final double horas;
  @override
  final bool aprovado;
  @override
  final bool? horasEmitidas;

  @override
  String toString() {
    return 'ColaboracaoAtividade(idResposta: $idResposta, idAtividade: $idAtividade, horas: $horas, aprovado: $aprovado, horasEmitidas: $horasEmitidas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColaboracaoAtividade &&
            const DeepCollectionEquality()
                .equals(other.idResposta, idResposta) &&
            const DeepCollectionEquality()
                .equals(other.idAtividade, idAtividade) &&
            const DeepCollectionEquality().equals(other.horas, horas) &&
            const DeepCollectionEquality().equals(other.aprovado, aprovado) &&
            const DeepCollectionEquality()
                .equals(other.horasEmitidas, horasEmitidas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idResposta),
      const DeepCollectionEquality().hash(idAtividade),
      const DeepCollectionEquality().hash(horas),
      const DeepCollectionEquality().hash(aprovado),
      const DeepCollectionEquality().hash(horasEmitidas));

  @JsonKey(ignore: true)
  @override
  _$ColaboracaoAtividadeCopyWith<_ColaboracaoAtividade> get copyWith =>
      __$ColaboracaoAtividadeCopyWithImpl<_ColaboracaoAtividade>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColaboracaoAtividadeToJson(this);
  }
}

abstract class _ColaboracaoAtividade implements ColaboracaoAtividade {
  const factory _ColaboracaoAtividade(
      String idResposta,
      String idAtividade,
      double horas,
      bool aprovado,
      bool? horasEmitidas) = _$_ColaboracaoAtividade;

  factory _ColaboracaoAtividade.fromJson(Map<String, dynamic> json) =
      _$_ColaboracaoAtividade.fromJson;

  @override
  String get idResposta;
  @override
  String get idAtividade;
  @override
  double get horas;
  @override
  bool get aprovado;
  @override
  bool? get horasEmitidas;
  @override
  @JsonKey(ignore: true)
  _$ColaboracaoAtividadeCopyWith<_ColaboracaoAtividade> get copyWith =>
      throw _privateConstructorUsedError;
}
