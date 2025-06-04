class cryptoMoeda {
  final String name;
  final String symbol;
  final DateTime dateAdded;
  final double priceUsd;
  double? priceBrl;

  cryptoMoeda({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUsd,
    this.priceBrl,
  });

  factory cryptoMoeda.fromJson(Map<String, dynamic> json, {required String currency}) {
    return cryptoMoeda(
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
