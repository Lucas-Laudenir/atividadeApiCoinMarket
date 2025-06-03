import 'package:http/http.dart' as http;
import '../utils/apiConstants.dart';

Future<http.Response> fetchCryptocurrenciesBySymbols(
  List<String> symbols, {
  String convert = 'USD',
}) async {
  final queryParams = {'symbol': symbols.join(','), 'convert': convert};

  final uri = Uri.https(
    'pro-api.coinmarketcap.com',
    '/v1/cryptocurrency/quotes/latest',
    queryParams,
  );

  try {
    final response = await http.get(
      uri,
      headers: {
        'X-CMC_PRO_API_KEY': ApiConstants.apiKey,
        'Accept': 'application/json',
      },
    );
    return response;
  } catch (e) {
    throw Exception('Erro ao buscar criptomoedas: $e');
  }
}