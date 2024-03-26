import 'package:flutter/material.dart';
import 'package:sui/builder/transaction_block.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/sui_client.dart';
import 'package:sui/sui_urls.dart';
import 'package:sui/types/objects.dart';
import 'package:sui/types/transactions.dart';
import 'package:sui_shinami/sui_shinami.dart';
import 'package:sui_shinami_example/app.dart';
import 'package:sui_shinami_example/other/sui_helper.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController transferObjectId = TextEditingController();

  late final ShinamiGasStation _gasStation;
  late final SuiAccount _myAccount;
  late final SuiAccount _recipientAccount;

  List<SuiObjectResponse> myObjects = [];
  List<SuiObjectResponse> recipientObjects = [];
  SuiTransactionBlockResponse? response;
  bool isGettingWalletObjects = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _gasStation = ShinamiGasStation(
        shinamiAccessKey: shinamiAccessKey);
    _myAccount = SuiAccount.ed25519Account();
    _recipientAccount = SuiAccount.ed25519Account();
  }

  Future<void> _getWalletObjects() async {
    final suiClient = SuiClient(SuiUrls.testnet);

    setState(() {
      isGettingWalletObjects = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    final myObjectsResponse = await suiClient.getOwnedObjects(
      _myAccount.getAddress(),
    );
    final recipientObjectsResponse = await suiClient.getOwnedObjects(
      _recipientAccount.getAddress(),
    );

    setState(() {
      isGettingWalletObjects = false;
      myObjects = myObjectsResponse.data;
      recipientObjects = recipientObjectsResponse.data;
      transferObjectId.text = myObjects.firstOrNull?.data?.objectId ?? '';
    });

    for (final object in myObjects.indexed) {
      debugPrint('My object ${object.$1} - ${object.$2.data?.toJson()}');
    }
    for (final object in recipientObjects.indexed) {
      debugPrint('Recipient object ${object.$1} - ${object.$2.data?.toJson()}');
    }
  }

  void showWalletObjects({bool isMy = true}) {
    final objects = isMy ? myObjects : recipientObjects;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: isMy ? Colors.blue : Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: objects.isEmpty
                        ? const Center(
                            child: Text(
                              'Wallet is empty.',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: objects.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = objects.elementAt(index);

                              return Text(
                                '$index - ${data.data?.toJson()}',
                                style: const TextStyle(color: Colors.white),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _requestFaucet() async {
    setState(() {
      isLoading = true;
    });

    await SuiHelper.requestFaucet(
      faucetEndPoint: SuiUrls.faucetTest,
      accountAddress: _myAccount.getAddress(),
    );

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _executeTransferTransaction() async {
    if (transferObjectId.text.isEmpty) {
      showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please input transfer object id.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );

      return;
    }

    final recipientAddress = _recipientAccount.getAddress();

    setState(() {
      isLoading = true;
      response = null;
    });

    try {
      response = await _gasStation.executeTransaction(
        senderAccount: _myAccount,
        prefixTransaction: (TransactionBlock transactionBlock) async {
          return transactionBlock.transferObjects(
            [
              transactionBlock.objectId(transferObjectId.text),
            ],
            transactionBlock.pureAddress(recipientAddress),
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
        transferObjectId.clear();
      });
    }
  }

  @override
  void dispose() {
    transferObjectId.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'My Wallet:',
                      children: [
                        TextSpan(
                          text: ' ${_myAccount.getAddress()}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                IconButton.filled(
                  onPressed: () => showWalletObjects(),
                  icon: const Icon(Icons.wallet),
                )
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Text.rich(
                  TextSpan(
                    text: 'Recipient Wallet:',
                    children: [
                      TextSpan(
                        text: ' ${_recipientAccount.getAddress()}',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )),
                const SizedBox(
                  width: 8.0,
                ),
                IconButton.filled(
                  onPressed: () => showWalletObjects(isMy: false),
                  icon: const Icon(Icons.wallet),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            isGettingWalletObjects
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _getWalletObjects,
                    child: const Text('Get Wallet Objects'),
                  ),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(),
            const SizedBox(
              height: 8.0,
            ),
            if (isLoading)
              const CircularProgressIndicator()
            else ...[
              ElevatedButton(
                onPressed: () async {
                  await _requestFaucet();

                  await Future.delayed(const Duration(seconds: 1));

                  _getWalletObjects();
                },
                child: const Text('Request Faucet'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _executeTransferTransaction();

                      await Future.delayed(const Duration(seconds: 5));

                      _getWalletObjects();
                    },
                    child: const Text('Transfer'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: transferObjectId,
                      ),
                    ),
                  )
                ],
              ),
            ],
            const SizedBox(
              height: 20.0,
            ),
            if (response case final response?)
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: response.json.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = response.json.entries.elementAt(index);

                      return Text(
                        '${data.key}: ${data.value}',
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
