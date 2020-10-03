import 'package:flutter/material.dart';
import './screens/list_page.dart';

void main() {
  runApp(Goli());
}

class Goli extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GOLI votes',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'Votes'),
    );
  }
}
