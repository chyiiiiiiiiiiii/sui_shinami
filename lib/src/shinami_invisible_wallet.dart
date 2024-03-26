import 'package:flutter/foundation.dart';
import 'package:sui/builder/transaction_block.dart';
import 'package:sui/sui_client.dart';
import 'package:sui/types/transactions.dart';
import 'package:sui_shinami/sui_shinami.dart';

final class ShinamiInvisibleWallet {
  ShinamiInvisibleWallet({
    required this.shinamiAccessKey,
  })  : nodeClient = SuiClient('${ShinamiUrls.nodeRpcUrl}/$shinamiAccessKey'),
        keyClient = KeyClient(shinamiAccessKey),
        walletClient = WalletClient(shinamiAccessKey);

  final String shinamiAccessKey;

  final SuiClient nodeClient;
  final KeyClient keyClient;
  final WalletClient walletClient;

  ShinamiInvisibleWalletSigner? walletSigner;

  Future<ShinamiInvisibleWalletSigner?> initWalletSigner({
    required String walletId,
    required String walletSecret,
  }) async {
    return walletSigner = ShinamiInvisibleWalletSigner.withSecret(
      walletId,
      walletClient,
      walletSecret,
      keyClient,
    );
  }

  Future<String?> getWalletAddress() async {
    final walletAddress =
        await walletSigner?.getAddress(autoCreate: true) ?? '';
    debugPrint('Invisible wallet address: $walletAddress');

    return walletAddress;
  }

  ///
  Future<SuiTransactionBlockResponse?> executeSponsoredTransaction({
    required Future<TransactionResult> Function(
      TransactionBlock transactionBlock,
    )? prefixTransaction,
  }) async {
    final gaslessPayloadBase64 = await buildGaslessTransactionBytes(
      suiClient: nodeClient,
      build: prefixTransaction,
    );

    final sponsorSignAndExecuteResponse =
        await walletSigner?.executeGaslessTransactionBlock(
      gaslessPayloadBase64,
      null,
      SuiTransactionBlockResponseOptions(showEffects: true),
      ExecuteTransactionRequestType.WaitForLocalExecution,
    );

    return sponsorSignAndExecuteResponse;
  }
}
