import 'dart:convert';
import '../models/cryptoMoeda.dart';
import '../datasources/coinmarketcapDatasource.dart';

class CryptoRepository {
  Future<List<cryptoMoeda>> getCryptosBySymbols(List<String> symbols) async {
    final response = await fetchCryptocurrenciesBySymbols(symbols, convert: 'USD');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];
      final cryptos = data.entries.map((e) {
        final value = e.value as Map<String, dynamic>;
        return cryptoMoeda.fromJson(value, currency: 'USD');
      }).toList();
      return cryptos;
    } else {
      throw Exception('Erro ao buscar dados');
    }
  }

  Future<void> updateCryptosWithBrl(List<cryptoMoeda> cryptos) async {
    final symbols = cryptos.map((c) => c.symbol).toList();
    final response = await fetchCryptocurrenciesBySymbols(symbols, convert: 'BRL');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];
      for (var crypto in cryptos) {
        final value = data[crypto.symbol];
        if (value != null) {
          crypto.priceBrl = (value['quote']['BRL']['price'] as num).toDouble();
        }
      }
    }
  }
}