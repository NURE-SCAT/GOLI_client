import 'package:provider/provider.dart';
import './providers/user_provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ChangeNotifierProvider.value(
    value: UserProvider(),
  ),
];
