import 'package:sui/types/transactions.dart';
import 'package:sui/utils/error.dart';
import 'package:sui_shinami/src/enums/execute_transaction_request_type.dart';
import 'package:sui_shinami/src/invisible_wallet/key_session.dart';
import 'package:sui_shinami/src/models/sign_transaction_result.dart';
import 'package:sui_shinami/src/rpc_clients/shinami_key_client.dart';
import 'package:sui_shinami/src/rpc_clients/shinami_wallet_client.dart';

class ShinamiInvisibleWalletSigner {
  ShinamiInvisibleWalletSigner._(
    this.walletId,
    this.walletClient,
    this.session,
  );

  factory ShinamiInvisibleWalletSigner.withSession(
    String walletId,
    WalletClient walletClient,
    KeySession session,
  ) {
    return ShinamiInvisibleWalletSigner._(walletId, walletClient, session);
  }

  factory ShinamiInvisibleWalletSigner.withSecret(
    String walletId,
    WalletClient walletClient,
    String secret,
    KeyClient keyClient,
  ) {
    final session = KeySession(secret, keyClient);
    return ShinamiInvisibleWalletSigner._(walletId, walletClient, session);
  }
  final String walletId;
  final WalletClient walletClient;
  late final KeySession session;

  String? address;

  Future<String> getAddress({bool autoCreate = false}) async {
    address ??= await _getAddress(autoCreate);
    return address!;
  }

  Future<String> _getAddress(bool autoCreate) async {
    try {
      return await walletClient.getWallet(walletId: walletId);
    } catch (e) {
      // Error handling should be adapted based on your error types in Dart
      if (autoCreate && e is RPCError && e.code == -32602) {
        final address = await tryCreate();
        if (address != null) return address;
        return walletClient.getWallet(walletId: walletId);
      }
      rethrow;
    }
  }

  Future<String?> tryCreate() async {
    try {
      return await session.withToken(
        (token) => walletClient.createWallet(
          walletId: walletId,
          sessionToken: token,
        ),
      );
    } catch (e) {
      // Error handling should be adapted based on your error types in Dart
      if (e is RPCError && e.code == -32602) {
        // Parse and check the error details
        return null;
      }
      rethrow;
    }
  }

  /// message: base64 string
  Future<SignTransactionResult> signTransactionBlock(String txBytes) async {
    return session.withToken(
      (token) => walletClient.signTransactionBlock(walletId, token, txBytes),
    );
  }

  /// message: base64 string
  Future<String> signPersonalMessage(
    String message, {
    bool wrapBcs = true,
  }) async {
    return session.withToken(
      (token) => walletClient.signPersonalMessage(
        walletId: walletId,
        sessionToken: token,
        message: message,
        wrapBcs: wrapBcs,
      ),
    );
  }

  /// txBytes: base64 string
  Future<SuiTransactionBlockResponse> executeGaslessTransactionBlock(
    String txBytes, [
    String? gasBudget,
    SuiTransactionBlockResponseOptions? options,
    ExecuteTransactionRequestType? requestType,
  ]) async {
    return session.withToken(
      (token) => walletClient.executeGaslessTransactionBlock(
        walletId,
        token,
        txBytes,
        gasBudget: gasBudget,
        options: options,
        requestType: requestType,
      ),
    );
  }

  Future<String> setBeneficiary(
    String beneficiaryGraphId,
    String beneficiaryAddress,
  ) async {
    return session.withToken(
      (token) => walletClient.setBeneficiary(
        walletId: token,
        sessionToken: token,
        beneficiaryGraphId: beneficiaryGraphId,
        beneficiaryAddress: beneficiaryAddress,
      ),
    );
  }

  Future<String> unsetBeneficiary(String beneficiaryGraphId) async {
    return session.withToken(
      (token) => walletClient.unsetBeneficiary(
        walletId: walletId,
        sessionToken: token,
        beneficiaryGraphId: beneficiaryGraphId,
      ),
    );
  }

  Future<String?> getBeneficiary(String beneficiaryGraphId) async {
    return walletClient.getBeneficiary(
      walletId: walletId,
      beneficiaryGraphId: beneficiaryGraphId,
    );
  }
}
