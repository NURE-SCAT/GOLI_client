import 'package:flutter/material.dart';
import '../services/privat_bank_api.dart';
import '../models/currency_rate.dart';

class CurrencyRateProvider with ChangeNotifier {
  final api = PrivatBankApiService();
  List<CurrencyRate> rates = [];

  Future<void> fetchRates() async {
    rates = await api.getCurrencyRates();
  }
}
