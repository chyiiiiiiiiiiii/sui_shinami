// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zk_login_proof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ZkLoginProof _$ZkLoginProofFromJson(Map<String, dynamic> json) {
  return _ZkLoginProof.fromJson(json);
}

/// @nodoc
mixin _$ZkLoginProof {
  ZkLoginProofPoints? get proofPoints => throw _privateConstructorUsedError;
  IssBase64Details? get issBase64Details => throw _privateConstructorUsedError;
  String get headerBase64 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZkLoginProofCopyWith<ZkLoginProof> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZkLoginProofCopyWith<$Res> {
  factory $ZkLoginProofCopyWith(
          ZkLoginProof value, $Res Function(ZkLoginProof) then) =
      _$ZkLoginProofCopyWithImpl<$Res, ZkLoginProof>;
  @useResult
  $Res call(
      {ZkLoginProofPoints? proofPoints,
      IssBase64Details? issBase64Details,
      String headerBase64});

  $ZkLoginProofPointsCopyWith<$Res>? get proofPoints;
  $IssBase64DetailsCopyWith<$Res>? get issBase64Details;
}

/// @nodoc
class _$ZkLoginProofCopyWithImpl<$Res, $Val extends ZkLoginProof>
    implements $ZkLoginProofCopyWith<$Res> {
  _$ZkLoginProofCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proofPoints = freezed,
    Object? issBase64Details = freezed,
    Object? headerBase64 = null,
  }) {
    return _then(_value.copyWith(
      proofPoints: freezed == proofPoints
          ? _value.proofPoints
          : proofPoints // ignore: cast_nullable_to_non_nullable
              as ZkLoginProofPoints?,
      issBase64Details: freezed == issBase64Details
          ? _value.issBase64Details
          : issBase64Details // ignore: cast_nullable_to_non_nullable
              as IssBase64Details?,
      headerBase64: null == headerBase64
          ? _value.headerBase64
          : headerBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ZkLoginProofPointsCopyWith<$Res>? get proofPoints {
    if (_value.proofPoints == null) {
      return null;
    }

    return $ZkLoginProofPointsCopyWith<$Res>(_value.proofPoints!, (value) {
      return _then(_value.copyWith(proofPoints: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IssBase64DetailsCopyWith<$Res>? get issBase64Details {
    if (_value.issBase64Details == null) {
      return null;
    }

    return $IssBase64DetailsCopyWith<$Res>(_value.issBase64Details!, (value) {
      return _then(_value.copyWith(issBase64Details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ZkLoginProofImplCopyWith<$Res>
    implements $ZkLoginProofCopyWith<$Res> {
  factory _$$ZkLoginProofImplCopyWith(
          _$ZkLoginProofImpl value, $Res Function(_$ZkLoginProofImpl) then) =
      __$$ZkLoginProofImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ZkLoginProofPoints? proofPoints,
      IssBase64Details? issBase64Details,
      String headerBase64});

  @override
  $ZkLoginProofPointsCopyWith<$Res>? get proofPoints;
  @override
  $IssBase64DetailsCopyWith<$Res>? get issBase64Details;
}

/// @nodoc
class __$$ZkLoginProofImplCopyWithImpl<$Res>
    extends _$ZkLoginProofCopyWithImpl<$Res, _$ZkLoginProofImpl>
    implements _$$ZkLoginProofImplCopyWith<$Res> {
  __$$ZkLoginProofImplCopyWithImpl(
      _$ZkLoginProofImpl _value, $Res Function(_$ZkLoginProofImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proofPoints = freezed,
    Object? issBase64Details = freezed,
    Object? headerBase64 = null,
  }) {
    return _then(_$ZkLoginProofImpl(
      proofPoints: freezed == proofPoints
          ? _value.proofPoints
          : proofPoints // ignore: cast_nullable_to_non_nullable
              as ZkLoginProofPoints?,
      issBase64Details: freezed == issBase64Details
          ? _value.issBase64Details
          : issBase64Details // ignore: cast_nullable_to_non_nullable
              as IssBase64Details?,
      headerBase64: null == headerBase64
          ? _value.headerBase64
          : headerBase64 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZkLoginProofImpl implements _ZkLoginProof {
  _$ZkLoginProofImpl(
      {this.proofPoints, this.issBase64Details, this.headerBase64 = ''});

  factory _$ZkLoginProofImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZkLoginProofImplFromJson(json);

  @override
  final ZkLoginProofPoints? proofPoints;
  @override
  final IssBase64Details? issBase64Details;
  @override
  @JsonKey()
  final String headerBase64;

  @override
  String toString() {
    return 'ZkLoginProof(proofPoints: $proofPoints, issBase64Details: $issBase64Details, headerBase64: $headerBase64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZkLoginProofImpl &&
            (identical(other.proofPoints, proofPoints) ||
                other.proofPoints == proofPoints) &&
            (identical(other.issBase64Details, issBase64Details) ||
                other.issBase64Details == issBase64Details) &&
            (identical(other.headerBase64, headerBase64) ||
                other.headerBase64 == headerBase64));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, proofPoints, issBase64Details, headerBase64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZkLoginProofImplCopyWith<_$ZkLoginProofImpl> get copyWith =>
      __$$ZkLoginProofImplCopyWithImpl<_$ZkLoginProofImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZkLoginProofImplToJson(
      this,
    );
  }
}

abstract class _ZkLoginProof implements ZkLoginProof {
  factory _ZkLoginProof(
      {final ZkLoginProofPoints? proofPoints,
      final IssBase64Details? issBase64Details,
      final String headerBase64}) = _$ZkLoginProofImpl;

  factory _ZkLoginProof.fromJson(Map<String, dynamic> json) =
      _$ZkLoginProofImpl.fromJson;

  @override
  ZkLoginProofPoints? get proofPoints;
  @override
  IssBase64Details? get issBase64Details;
  @override
  String get headerBase64;
  @override
  @JsonKey(ignore: true)
  _$$ZkLoginProofImplCopyWith<_$ZkLoginProofImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZkLoginProofPoints _$ZkLoginProofPointsFromJson(Map<String, dynamic> json) {
  return _ZkLoginProofPoints.fromJson(json);
}

/// @nodoc
mixin _$ZkLoginProofPoints {
  List<String> get a => throw _privateConstructorUsedError;
  List<List<String>> get b => throw _privateConstructorUsedError;
  List<String> get c => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZkLoginProofPointsCopyWith<ZkLoginProofPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZkLoginProofPointsCopyWith<$Res> {
  factory $ZkLoginProofPointsCopyWith(
          ZkLoginProofPoints value, $Res Function(ZkLoginProofPoints) then) =
      _$ZkLoginProofPointsCopyWithImpl<$Res, ZkLoginProofPoints>;
  @useResult
  $Res call({List<String> a, List<List<String>> b, List<String> c});
}

/// @nodoc
class _$ZkLoginProofPointsCopyWithImpl<$Res, $Val extends ZkLoginProofPoints>
    implements $ZkLoginProofPointsCopyWith<$Res> {
  _$ZkLoginProofPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? c = null,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as List<String>,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      c: null == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZkLoginProofPointsImplCopyWith<$Res>
    implements $ZkLoginProofPointsCopyWith<$Res> {
  factory _$$ZkLoginProofPointsImplCopyWith(_$ZkLoginProofPointsImpl value,
          $Res Function(_$ZkLoginProofPointsImpl) then) =
      __$$ZkLoginProofPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> a, List<List<String>> b, List<String> c});
}

/// @nodoc
class __$$ZkLoginProofPointsImplCopyWithImpl<$Res>
    extends _$ZkLoginProofPointsCopyWithImpl<$Res, _$ZkLoginProofPointsImpl>
    implements _$$ZkLoginProofPointsImplCopyWith<$Res> {
  __$$ZkLoginProofPointsImplCopyWithImpl(_$ZkLoginProofPointsImpl _value,
      $Res Function(_$ZkLoginProofPointsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? c = null,
  }) {
    return _then(_$ZkLoginProofPointsImpl(
      a: null == a
          ? _value._a
          : a // ignore: cast_nullable_to_non_nullable
              as List<String>,
      b: null == b
          ? _value._b
          : b // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      c: null == c
          ? _value._c
          : c // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZkLoginProofPointsImpl implements _ZkLoginProofPoints {
  _$ZkLoginProofPointsImpl(
      {final List<String> a = const [],
      final List<List<String>> b = const [],
      final List<String> c = const []})
      : _a = a,
        _b = b,
        _c = c;

  factory _$ZkLoginProofPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZkLoginProofPointsImplFromJson(json);

  final List<String> _a;
  @override
  @JsonKey()
  List<String> get a {
    if (_a is EqualUnmodifiableListView) return _a;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_a);
  }

  final List<List<String>> _b;
  @override
  @JsonKey()
  List<List<String>> get b {
    if (_b is EqualUnmodifiableListView) return _b;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_b);
  }

  final List<String> _c;
  @override
  @JsonKey()
  List<String> get c {
    if (_c is EqualUnmodifiableListView) return _c;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_c);
  }

  @override
  String toString() {
    return 'ZkLoginProofPoints(a: $a, b: $b, c: $c)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZkLoginProofPointsImpl &&
            const DeepCollectionEquality().equals(other._a, _a) &&
            const DeepCollectionEquality().equals(other._b, _b) &&
            const DeepCollectionEquality().equals(other._c, _c));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_a),
      const DeepCollectionEquality().hash(_b),
      const DeepCollectionEquality().hash(_c));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZkLoginProofPointsImplCopyWith<_$ZkLoginProofPointsImpl> get copyWith =>
      __$$ZkLoginProofPointsImplCopyWithImpl<_$ZkLoginProofPointsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZkLoginProofPointsImplToJson(
      this,
    );
  }
}

abstract class _ZkLoginProofPoints implements ZkLoginProofPoints {
  factory _ZkLoginProofPoints(
      {final List<String> a,
      final List<List<String>> b,
      final List<String> c}) = _$ZkLoginProofPointsImpl;

  factory _ZkLoginProofPoints.fromJson(Map<String, dynamic> json) =
      _$ZkLoginProofPointsImpl.fromJson;

  @override
  List<String> get a;
  @override
  List<List<String>> get b;
  @override
  List<String> get c;
  @override
  @JsonKey(ignore: true)
  _$$ZkLoginProofPointsImplCopyWith<_$ZkLoginProofPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
