import 'package:sui_shinami/src/models/zk_login_wallet.dart';
import 'package:sui_shinami/src/rpc_clients/shinami_rpc_client.dart';
import 'package:sui_shinami/sui_shinami.dart';

/// zkLogin RPC client.
class ShinamiZkWalletClient extends ShinamiRpcClient {
  /// @param accessKey Gas access key. Note that the access key also determines which network your
  ///    transactions are targeting.
  /// @param url Optional URL override.
  ShinamiZkWalletClient(
    this.accessKey, {
    String url = ShinamiUrls.zkWalletRpcUrl,
  }) : super(
          url,
          headers: {
            'X-API-Key': accessKey,
          },
        );

  final String accessKey;

  /// Retrieves a zkLogin wallet or creates a new one if necessary.
  /// @param jwt A valid JWT signed by one of the supported OpenID providers.
  /// @param keyClaimName The claim name in the JWT that identifies a particular user.
  /// @param subWallet The sub-wallet id, which enables the same OpenID user to have more than one
  ///    wallet addresses.
  /// @returns The zkLogin proof for the given JWT.
  Future<ZkLoginWallet> getOrCreateZkLoginWallet({
    required String jwt,
    String? keyClaimName,
    int? subWallet,
  }) async {
    final result = await client.request(
      'shinami_zkw_getOrCreateZkLoginWallet',
      [
        jwt,
        keyClaimName,
        subWallet,
      ],
    ) as Map<String, dynamic>;

    return ZkLoginWallet.fromJson(result);
  }
}
