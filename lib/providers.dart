import 'package:provider/provider.dart';
import './providers/vote_provider.dart';

List<SingleChildCloneableWidget> appProviders = [
  ChangeNotifierProvider.value(
    value: VoteProvider(),
  ),
];
