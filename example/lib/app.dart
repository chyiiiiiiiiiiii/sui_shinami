import 'package:flutter/material.dart';
import 'package:sui_shinami_example/pages/home_page.dart';

const gasStationAndNodeAccessKey =
    String.fromEnvironment('gasStationAndNodeAccessKey');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
