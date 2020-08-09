import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/currency_rate.dart';

/*
* Singleton service for work with privat bank api
* docs: https://api.privatbank.ua/#p24/exchange
*/
class PrivatBankApiService {
  static final PrivatBankApiService _singleton =
      PrivatBankApiService._internal();

  factory PrivatBankApiService() {
    return _singleton;
  }

  PrivatBankApiService._internal();

  Future<List<CurrencyRate>> getCurrencyRates() async {
    final String url =
        "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11";

    final response = await http.get(url);

    if (response.statusCode != 200) {
      //todo: throw smth
    }

    final responseJson = json.decode(response.body) as List<dynamic>;
    return responseJson.map((e) => CurrencyRate.fromJson(e)).toList();
  }
}
