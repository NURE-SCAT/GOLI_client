class CurrencyRate {
  final String alias;
  final double buy;
  final double sale;

  CurrencyRate.fromJson(Map<String, dynamic> json)
      : alias = json["ccy"],
        buy = double.parse(json["buy"]),
        sale = double.parse(json["sale"]);
}
