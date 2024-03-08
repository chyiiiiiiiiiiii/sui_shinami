import 'package:flutter/material.dart';
import 'package:sui_shinami_example/pages/normal_page.dart';
import 'package:sui_shinami_example/pages/transfer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sui Shinami Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const NormalPage(),
                ),
              ),
              child: const Text('Normal'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const TransferPage(),
                ),
              ),
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
