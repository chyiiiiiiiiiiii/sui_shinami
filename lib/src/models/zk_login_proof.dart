import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sui_shinami/src/models/iss_base64_details.dart';

part 'zk_login_proof.freezed.dart';
part 'zk_login_proof.g.dart';

@freezed
class ZkLoginProof with _$ZkLoginProof {
  factory ZkLoginProof({
    ZkLoginProofPoints? proofPoints,
    IssBase64Details? issBase64Details,
    @Default('') String headerBase64,
  }) = _ZkLoginProof;

  factory ZkLoginProof.fromJson(Map<String, dynamic> json) =>
      _$ZkLoginProofFromJson(json);
}

@freezed
class ZkLoginProofPoints with _$ZkLoginProofPoints {
  factory ZkLoginProofPoints({
    @Default([]) List<String> a,
    @Default([]) List<List<String>> b,
    @Default([]) List<String> c,
  }) = _ZkLoginProofPoints;

  factory ZkLoginProofPoints.fromJson(Map<String, dynamic> json) =>
      _$ZkLoginProofPointsFromJson(json);
}
