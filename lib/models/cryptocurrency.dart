class Cryptocurrency {
  final String name;
  final String symbol;
  final DateTime dateAdded;
  final double priceUsd;
  double? priceBrl;

  Cryptocurrency({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUsd,
    this.priceBrl,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json, {required String currency}) {
    return Cryptocurrency(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      dateAdded: DateTime.tryParse(json['date_added'] ?? '') ?? DateTime.now(),
      priceUsd: currency == 'USD'
          ? (json['quote']['USD']['price'] as num).toDouble()
          : 0.0,
      priceBrl: currency == 'BRL'
          ? (json['quote']['BRL']['price'] as num).toDouble()
          : null,
    );
  }
}
