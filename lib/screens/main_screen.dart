import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/currency_rate_provider.dart';
import '../components/account_info.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  Future<void> _fetchData(BuildContext context) async {
    await Provider.of<CurrencyRateProvider>(context, listen: false)
        .fetchRates();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      _fetchData(context).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('MoneyBag'),
    );

    return Scaffold(
        appBar: appBar,
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: AccountInfo(),
              ));
  }
}
