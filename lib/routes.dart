import 'package:flutter/widgets.dart';
import './screens/main_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  MainScreen.routeName: (BuildContext context) => MainScreen(),
};
