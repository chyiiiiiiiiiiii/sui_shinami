// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_zk_login_proof_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateZkLoginProofResult _$CreateZkLoginProofResultFromJson(
    Map<String, dynamic> json) {
  return _CreateZkLoginProofResult.fromJson(json);
}

/// @nodoc
mixin _$CreateZkLoginProofResult {
  ZkLoginProof? get zkLoginProof => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateZkLoginProofResultCopyWith<CreateZkLoginProofResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateZkLoginProofResultCopyWith<$Res> {
  factory $CreateZkLoginProofResultCopyWith(CreateZkLoginProofResult value,
          $Res Function(CreateZkLoginProofResult) then) =
      _$CreateZkLoginProofResultCopyWithImpl<$Res, CreateZkLoginProofResult>;
  @useResult
  $Res call({ZkLoginProof? zkLoginProof});

  $ZkLoginProofCopyWith<$Res>? get zkLoginProof;
}

/// @nodoc
class _$CreateZkLoginProofResultCopyWithImpl<$Res,
        $Val extends CreateZkLoginProofResult>
    implements $CreateZkLoginProofResultCopyWith<$Res> {
  _$CreateZkLoginProofResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zkLoginProof = freezed,
  }) {
    return _then(_value.copyWith(
      zkLoginProof: freezed == zkLoginProof
          ? _value.zkLoginProof
          : zkLoginProof // ignore: cast_nullable_to_non_nullable
              as ZkLoginProof?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ZkLoginProofCopyWith<$Res>? get zkLoginProof {
    if (_value.zkLoginProof == null) {
      return null;
    }

    return $ZkLoginProofCopyWith<$Res>(_value.zkLoginProof!, (value) {
      return _then(_value.copyWith(zkLoginProof: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateZkLoginProofResultImplCopyWith<$Res>
    implements $CreateZkLoginProofResultCopyWith<$Res> {
  factory _$$CreateZkLoginProofResultImplCopyWith(
          _$CreateZkLoginProofResultImpl value,
          $Res Function(_$CreateZkLoginProofResultImpl) then) =
      __$$CreateZkLoginProofResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ZkLoginProof? zkLoginProof});

  @override
  $ZkLoginProofCopyWith<$Res>? get zkLoginProof;
}

/// @nodoc
class __$$CreateZkLoginProofResultImplCopyWithImpl<$Res>
    extends _$CreateZkLoginProofResultCopyWithImpl<$Res,
        _$CreateZkLoginProofResultImpl>
    implements _$$CreateZkLoginProofResultImplCopyWith<$Res> {
  __$$CreateZkLoginProofResultImplCopyWithImpl(
      _$CreateZkLoginProofResultImpl _value,
      $Res Function(_$CreateZkLoginProofResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zkLoginProof = freezed,
  }) {
    return _then(_$CreateZkLoginProofResultImpl(
      zkLoginProof: freezed == zkLoginProof
          ? _value.zkLoginProof
          : zkLoginProof // ignore: cast_nullable_to_non_nullable
              as ZkLoginProof?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateZkLoginProofResultImpl implements _CreateZkLoginProofResult {
  _$CreateZkLoginProofResultImpl({this.zkLoginProof});

  factory _$CreateZkLoginProofResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateZkLoginProofResultImplFromJson(json);

  @override
  final ZkLoginProof? zkLoginProof;

  @override
  String toString() {
    return 'CreateZkLoginProofResult(zkLoginProof: $zkLoginProof)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateZkLoginProofResultImpl &&
            (identical(other.zkLoginProof, zkLoginProof) ||
                other.zkLoginProof == zkLoginProof));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, zkLoginProof);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateZkLoginProofResultImplCopyWith<_$CreateZkLoginProofResultImpl>
      get copyWith => __$$CreateZkLoginProofResultImplCopyWithImpl<
          _$CreateZkLoginProofResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateZkLoginProofResultImplToJson(
      this,
    );
  }
}

abstract class _CreateZkLoginProofResult implements CreateZkLoginProofResult {
  factory _CreateZkLoginProofResult({final ZkLoginProof? zkLoginProof}) =
      _$CreateZkLoginProofResultImpl;

  factory _CreateZkLoginProofResult.fromJson(Map<String, dynamic> json) =
      _$CreateZkLoginProofResultImpl.fromJson;

  @override
  ZkLoginProof? get zkLoginProof;
  @override
  @JsonKey(ignore: true)
  _$$CreateZkLoginProofResultImplCopyWith<_$CreateZkLoginProofResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
