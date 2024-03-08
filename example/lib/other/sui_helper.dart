import 'package:flutter/material.dart';
import 'package:sui/rpc/faucet_client.dart';
import 'package:sui/types/faucet.dart';

class SuiHelper {
  static Future<BatchSendStatusType?> requestFaucet({
    required String faucetEndPoint,
    required String accountAddress,
  }) async {
    final faucetClient = FaucetClient(faucetEndPoint);
    final batchFaucetResponse =
        await faucetClient.requestSuiFromFaucetV1(accountAddress);

    final task = batchFaucetResponse.task;
    if (task == null) {
      return null;
    }

    while (true) {
      final statusResponse = await faucetClient.getFaucetRequestStatus(task);
      debugPrint('$statusResponse');

      if (statusResponse.status.status == BatchSendStatus.SUCCEEDED) {
        return statusResponse.status;
      } else {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }
}
