import 'package:flutter/material.dart';
import 'package:sui/builder/transaction_block.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/types/transactions.dart';
import 'package:sui_shinami/sui_shinami.dart';
import 'package:sui_shinami_example/app.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({super.key});

  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  late final ShinamiGasStation _gasStation;
  late final SuiAccount _myAccount;

  SuiTransactionBlockResponse? response;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _gasStation = ShinamiGasStation(
        shinamiAccessKey: shinamiAccessKey);
    _myAccount = SuiAccount.ed25519Account();
  }

  Future<void> _executeNormalTransaction() async {
    const movePackageAddress =
        '0xfa0e78030bd16672174c2d6cc4cd5d1d1423d03c28a74909b2a148eda8bcca16';
    const movePackageModule = 'clock';
    const movePackageMethod = 'access';

    setState(() {
      isLoading = true;
      response = null;
    });

    try {
      response = await _gasStation.executeTransaction(
        senderAccount: _myAccount,
        prefixTransaction: (TransactionBlock transactionBlock) async {
          return transactionBlock.moveCall(
            '$movePackageAddress::$movePackageModule::$movePackageMethod',
            arguments: [
              transactionBlock.object('0x6'),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normal'),
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
                      text: ' ${_myAccount.getAddress()}',
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
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _executeNormalTransaction,
                      child: const Text('Normal Transaction'),
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
