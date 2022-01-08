// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Localizacao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Localizacao _$LocalizacaoFromJson(Map<String, dynamic> json) {
  return _Localizacao.fromJson(json);
}

/// @nodoc
class _$LocalizacaoTearOff {
  const _$LocalizacaoTearOff();

  _Localizacao call(double lat, double lng) {
    return _Localizacao(
      lat,
      lng,
    );
  }

  Localizacao fromJson(Map<String, Object?> json) {
    return Localizacao.fromJson(json);
  }
}

/// @nodoc
const $Localizacao = _$LocalizacaoTearOff();

/// @nodoc
mixin _$Localizacao {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizacaoCopyWith<Localizacao> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizacaoCopyWith<$Res> {
  factory $LocalizacaoCopyWith(
          Localizacao value, $Res Function(Localizacao) then) =
      _$LocalizacaoCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LocalizacaoCopyWithImpl<$Res> implements $LocalizacaoCopyWith<$Res> {
  _$LocalizacaoCopyWithImpl(this._value, this._then);

  final Localizacao _value;
  // ignore: unused_field
  final $Res Function(Localizacao) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$LocalizacaoCopyWith<$Res>
    implements $LocalizacaoCopyWith<$Res> {
  factory _$LocalizacaoCopyWith(
          _Localizacao value, $Res Function(_Localizacao) then) =
      __$LocalizacaoCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$LocalizacaoCopyWithImpl<$Res> extends _$LocalizacaoCopyWithImpl<$Res>
    implements _$LocalizacaoCopyWith<$Res> {
  __$LocalizacaoCopyWithImpl(
      _Localizacao _value, $Res Function(_Localizacao) _then)
      : super(_value, (v) => _then(v as _Localizacao));

  @override
  _Localizacao get _value => super._value as _Localizacao;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_Localizacao(
      lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Localizacao implements _Localizacao {
  const _$_Localizacao(this.lat, this.lng);

  factory _$_Localizacao.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizacaoFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'Localizacao(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Localizacao &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
  _$LocalizacaoCopyWith<_Localizacao> get copyWith =>
      __$LocalizacaoCopyWithImpl<_Localizacao>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizacaoToJson(this);
  }
}

abstract class _Localizacao implements Localizacao {
  const factory _Localizacao(double lat, double lng) = _$_Localizacao;

  factory _Localizacao.fromJson(Map<String, dynamic> json) =
      _$_Localizacao.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$LocalizacaoCopyWith<_Localizacao> get copyWith =>
      throw _privateConstructorUsedError;
}
