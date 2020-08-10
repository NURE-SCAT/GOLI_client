import 'package:flutter/material.dart';
import '../services/privat_bank_api.dart';
import '../models/currency_rate.dart';

class CurrencyRateProvider with ChangeNotifier {
  final api = PrivatBankApiService();
  List<CurrencyRate> rates = [];

  Future<void> fetchRates() async {
    rates = await api.getCurrencyRates();
  }

  double getBuyByAlias(String alias) {
    CurrencyRate rate = rates.firstWhere((element) => element.alias == alias,
        orElse: () => null);
    if (rate == null) {
      return -1;
    }

    return rate.buy;
  }

  double getSellByAlias(String alias) {
    CurrencyRate rate = rates.firstWhere((element) => element.alias == alias,
        orElse: () => null);
    if (rate == null) {
      return -1;
    }

    return rate.sale;
  }
}
