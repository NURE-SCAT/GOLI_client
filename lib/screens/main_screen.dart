import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('MoneyBag'),
    );

    return Scaffold(
        appBar: appBar,
        body: Center(
          child: Text("Test"),
        ));
  }
}
