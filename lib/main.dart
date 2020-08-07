import 'package:flutter/material.dart';
import './theme/style.dart';

void main() {
  runApp(MoneyBag());
}

class MoneyBag extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Bag',
      theme: appTheme(),
      home: Container(),
    );
  }
}
