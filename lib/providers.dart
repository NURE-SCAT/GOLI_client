import 'package:provider/provider.dart';
import './providers/user_provider.dart';
import './providers/currency_rate_provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ChangeNotifierProvider.value(
    value: UserProvider(),
  ),
  ChangeNotifierProvider.value(
    value: CurrencyRateProvider(),
  ),
];
