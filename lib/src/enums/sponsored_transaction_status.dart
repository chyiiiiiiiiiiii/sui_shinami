// ignore_for_file: constant_identifier_names

import 'package:sui_shinami/src/extensions/iterable_extension.dart';

enum SponsoredTransactionStatus {
  IN_FLIGHT,
  COMPLETE,
  INVALID;

  static SponsoredTransactionStatus fromString(String value) {
    return SponsoredTransactionStatus.values
            .firstWhereOrNull((e) => value == e.name) ??
        SponsoredTransactionStatus.INVALID;
  }
}
