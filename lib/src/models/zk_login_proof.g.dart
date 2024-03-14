// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zk_login_proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZkLoginProofImpl _$$ZkLoginProofImplFromJson(Map<String, dynamic> json) =>
    _$ZkLoginProofImpl(
      proofPoints: json['proofPoints'] == null
          ? null
          : ZkLoginProofPoints.fromJson(
              json['proofPoints'] as Map<String, dynamic>),
      issBase64Details: json['issBase64Details'] == null
          ? null
          : IssBase64Details.fromJson(
              json['issBase64Details'] as Map<String, dynamic>),
      headerBase64: json['headerBase64'] as String? ?? '',
    );

Map<String, dynamic> _$$ZkLoginProofImplToJson(_$ZkLoginProofImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('proofPoints', instance.proofPoints?.toJson());
  writeNotNull('issBase64Details', instance.issBase64Details?.toJson());
  val['headerBase64'] = instance.headerBase64;
  return val;
}

_$ZkLoginProofPointsImpl _$$ZkLoginProofPointsImplFromJson(
        Map<String, dynamic> json) =>
    _$ZkLoginProofPointsImpl(
      a: (json['a'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      b: (json['b'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          const [],
      c: (json['c'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$ZkLoginProofPointsImplToJson(
        _$ZkLoginProofPointsImpl instance) =>
    <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
    };
