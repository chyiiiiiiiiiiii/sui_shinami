import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sui/builder/transaction_block.dart';
import 'package:sui/types/transactions.dart';
import 'package:sui_shinami/sui_shinami.dart';
import 'package:sui_shinami_example/app.dart';

class InvisibleWalletPage extends StatefulWidget {
  const InvisibleWalletPage({super.key});

  @override
  State<InvisibleWalletPage> createState() => _InvisibleWalletPageState();
}

class _InvisibleWalletPageState extends State<InvisibleWalletPage> {
  late final ShinamiInvisibleWallet shinamiInvisibleWallet =
      ShinamiInvisibleWallet(shinamiAccessKey: shinamiAccessKey);

  String walletId = '';
  String walletSecret = '';

  ShinamiInvisibleWalletSigner? signer;
  String walletAddress = '';

  bool get hasWallet => walletAddress.isNotEmpty;

  SuiTransactionBlockResponse? response;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    walletId = '1';
    walletSecret = Random().nextInt(1000000).toString();
  }

  Future<void> initWalletSigner({
    required String walletId,
    required String walletSecret,
  }) async {
    await shinamiInvisibleWallet.initWalletSigner(
      walletId: walletId,
      walletSecret: walletSecret,
    );

    walletAddress = await shinamiInvisibleWallet.getWalletAddress() ?? '';

    setState(() {});
  }

  Future<void> executeSponsoredTransaction() async {
    /// Dev
    const moveDevPackageAddress =
        '0xf77b20e7ea8486e8a66b1166db7eb3140c9e7da40793f731beeacfb797ccfc60';
    const moveDevPackageModule = 'math';
    const moveDevPackageMethod = 'add';

    setState(() {
      isLoading = true;
      response = null;
    });

    try {
      final response = await shinamiInvisibleWallet.executeSponsoredTransaction(
        prefixTransaction: (TransactionBlock transactionBlock) async {
          return transactionBlock.moveCall(
            '$moveDevPackageAddress::$moveDevPackageModule::$moveDevPackageMethod',
            arguments: [
              transactionBlock.pure(1),
              transactionBlock.pure(2),
            ],
          );
        },
      );

      debugPrint(
        'sponsorSignAndExecuteResponse.digest: ${response?.digest}',
      );
    } catch (error) {
      debugPrint('ERROR - ${error.toString()}');
    } finally {
      setState(() {
        isLoading = false;
        response = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invisible Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'My Wallet:',
                  children: [
                    TextSpan(
                      text: ' $walletAddress',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              if (!hasWallet)
                ElevatedButton(
                  onPressed: () => initWalletSigner(
                    walletId: walletId,
                    walletSecret: walletSecret,
                  ),
                  child: const Text('Get or create Wallet'),
                )
              else
                ElevatedButton(
                  onPressed: executeSponsoredTransaction,
                  child: const Text('executeSponsoredTransaction'),
                ),
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
                      padding: const EdgeInsets.all(20.0),
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
      ),
    );
  }
}
