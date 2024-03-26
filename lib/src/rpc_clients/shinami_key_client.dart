// Shinami Key RPC client.
import 'package:sui_shinami/src/rpc_clients/shinami_rpc_client.dart';
import 'package:sui_shinami/sui_shinami.dart';

class KeyClient extends ShinamiRpcClient {
  // Constructor with accessKey and optional url.
  KeyClient(
    this.accessKey, {
    this.url = ShinamiUrls.nodeRpcUrl,
  }) : super(
          url,
          headers: {
            'X-API-Key': accessKey,
          },
        );

  final String accessKey;
  final String url;

  // Creates a session with the provided wallet secret.
  Future<String> createSession({required String secret}) async {
    final result = await client.request(
      'shinami_key_createSession',
      [secret],
    ) as String;

    return result;
  }
}
