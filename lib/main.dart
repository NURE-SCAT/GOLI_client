import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/user_provider.dart';
import './routes.dart';
import './providers.dart';
import './theme/style.dart';

void main() {
  runApp(MoneyBag());
}

class MoneyBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Consumer<UserProvider>(
        builder: (ctx, usrPr, _) => MaterialApp(
          title: 'MoneyBag',
          theme: appTheme(),
          initialRoute: usrPr.isAuth ? '/' : '/login',
          routes: routes,
        ),
      ),
      providers: appProviders,
    );
  }
}
