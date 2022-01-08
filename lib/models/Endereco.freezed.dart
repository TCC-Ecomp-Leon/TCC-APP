// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Endereco.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Endereco _$EnderecoFromJson(Map<String, dynamic> json) {
  return _Endereco.fromJson(json);
}

/// @nodoc
class _$EnderecoTearOff {
  const _$EnderecoTearOff();

  _Endereco call(String rua, int numero, String? complemento, String bairro,
      String cidade, String estado, int cep, Localizacao localizacao) {
    return _Endereco(
      rua,
      numero,
      complemento,
      bairro,
      cidade,
      estado,
      cep,
      localizacao,
    );
  }

  Endereco fromJson(Map<String, Object?> json) {
    return Endereco.fromJson(json);
  }
}

/// @nodoc
const $Endereco = _$EnderecoTearOff();

/// @nodoc
mixin _$Endereco {
  String get rua => throw _privateConstructorUsedError;
  int get numero => throw _privateConstructorUsedError;
  String? get complemento => throw _privateConstructorUsedError;
  String get bairro => throw _privateConstructorUsedError;
  String get cidade => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;
  int get cep => throw _privateConstructorUsedError;
  Localizacao get localizacao => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnderecoCopyWith<Endereco> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnderecoCopyWith<$Res> {
  factory $EnderecoCopyWith(Endereco value, $Res Function(Endereco) then) =
      _$EnderecoCopyWithImpl<$Res>;
  $Res call(
      {String rua,
      int numero,
      String? complemento,
      String bairro,
      String cidade,
      String estado,
      int cep,
      Localizacao localizacao});

  $LocalizacaoCopyWith<$Res> get localizacao;
}

/// @nodoc
class _$EnderecoCopyWithImpl<$Res> implements $EnderecoCopyWith<$Res> {
  _$EnderecoCopyWithImpl(this._value, this._then);

  final Endereco _value;
  // ignore: unused_field
  final $Res Function(Endereco) _then;

  @override
  $Res call({
    Object? rua = freezed,
    Object? numero = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? cidade = freezed,
    Object? estado = freezed,
    Object? cep = freezed,
    Object? localizacao = freezed,
  }) {
    return _then(_value.copyWith(
      rua: rua == freezed
          ? _value.rua
          : rua // ignore: cast_nullable_to_non_nullable
              as String,
      numero: numero == freezed
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as int,
      complemento: complemento == freezed
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: bairro == freezed
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String,
      cidade: cidade == freezed
          ? _value.cidade
          : cidade // ignore: cast_nullable_to_non_nullable
              as String,
      estado: estado == freezed
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      cep: cep == freezed
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as int,
      localizacao: localizacao == freezed
          ? _value.localizacao
          : localizacao // ignore: cast_nullable_to_non_nullable
              as Localizacao,
    ));
  }

  @override
  $LocalizacaoCopyWith<$Res> get localizacao {
    return $LocalizacaoCopyWith<$Res>(_value.localizacao, (value) {
      return _then(_value.copyWith(localizacao: value));
    });
  }
}

/// @nodoc
abstract class _$EnderecoCopyWith<$Res> implements $EnderecoCopyWith<$Res> {
  factory _$EnderecoCopyWith(_Endereco value, $Res Function(_Endereco) then) =
      __$EnderecoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rua,
      int numero,
      String? complemento,
      String bairro,
      String cidade,
      String estado,
      int cep,
      Localizacao localizacao});

  @override
  $LocalizacaoCopyWith<$Res> get localizacao;
}

/// @nodoc
class __$EnderecoCopyWithImpl<$Res> extends _$EnderecoCopyWithImpl<$Res>
    implements _$EnderecoCopyWith<$Res> {
  __$EnderecoCopyWithImpl(_Endereco _value, $Res Function(_Endereco) _then)
      : super(_value, (v) => _then(v as _Endereco));

  @override
  _Endereco get _value => super._value as _Endereco;

  @override
  $Res call({
    Object? rua = freezed,
    Object? numero = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? cidade = freezed,
    Object? estado = freezed,
    Object? cep = freezed,
    Object? localizacao = freezed,
  }) {
    return _then(_Endereco(
      rua == freezed
          ? _value.rua
          : rua // ignore: cast_nullable_to_non_nullable
              as String,
      numero == freezed
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as int,
      complemento == freezed
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro == freezed
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String,
      cidade == freezed
          ? _value.cidade
          : cidade // ignore: cast_nullable_to_non_nullable
              as String,
      estado == freezed
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      cep == freezed
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as int,
      localizacao == freezed
          ? _value.localizacao
          : localizacao // ignore: cast_nullable_to_non_nullable
              as Localizacao,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Endereco implements _Endereco {
  const _$_Endereco(this.rua, this.numero, this.complemento, this.bairro,
      this.cidade, this.estado, this.cep, this.localizacao);

  factory _$_Endereco.fromJson(Map<String, dynamic> json) =>
      _$$_EnderecoFromJson(json);

  @override
  final String rua;
  @override
  final int numero;
  @override
  final String? complemento;
  @override
  final String bairro;
  @override
  final String cidade;
  @override
  final String estado;
  @override
  final int cep;
  @override
  final Localizacao localizacao;

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, complemento: $complemento, bairro: $bairro, cidade: $cidade, estado: $estado, cep: $cep, localizacao: $localizacao)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Endereco &&
            const DeepCollectionEquality().equals(other.rua, rua) &&
            const DeepCollectionEquality().equals(other.numero, numero) &&
            const DeepCollectionEquality()
                .equals(other.complemento, complemento) &&
            const DeepCollectionEquality().equals(other.bairro, bairro) &&
            const DeepCollectionEquality().equals(other.cidade, cidade) &&
            const DeepCollectionEquality().equals(other.estado, estado) &&
            const DeepCollectionEquality().equals(other.cep, cep) &&
            const DeepCollectionEquality()
                .equals(other.localizacao, localizacao));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rua),
      const DeepCollectionEquality().hash(numero),
      const DeepCollectionEquality().hash(complemento),
      const DeepCollectionEquality().hash(bairro),
      const DeepCollectionEquality().hash(cidade),
      const DeepCollectionEquality().hash(estado),
      const DeepCollectionEquality().hash(cep),
      const DeepCollectionEquality().hash(localizacao));

  @JsonKey(ignore: true)
  @override
  _$EnderecoCopyWith<_Endereco> get copyWith =>
      __$EnderecoCopyWithImpl<_Endereco>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnderecoToJson(this);
  }
}

abstract class _Endereco implements Endereco {
  const factory _Endereco(
      String rua,
      int numero,
      String? complemento,
      String bairro,
      String cidade,
      String estado,
      int cep,
      Localizacao localizacao) = _$_Endereco;

  factory _Endereco.fromJson(Map<String, dynamic> json) = _$_Endereco.fromJson;

  @override
  String get rua;
  @override
  int get numero;
  @override
  String? get complemento;
  @override
  String get bairro;
  @override
  String get cidade;
  @override
  String get estado;
  @override
  int get cep;
  @override
  Localizacao get localizacao;
  @override
  @JsonKey(ignore: true)
  _$EnderecoCopyWith<_Endereco> get copyWith =>
      throw _privateConstructorUsedError;
}
