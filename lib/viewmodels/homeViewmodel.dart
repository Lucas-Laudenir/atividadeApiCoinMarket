import 'package:flutter/foundation.dart';
import '../models/cryptoMoeda.dart';
import '../repositories/cryptoRepository.dart';

class HomeViewModel extends ChangeNotifier {
  final CryptoRepository repository;
  List<cryptoMoeda> _cryptos = [];
  bool _isLoading = false;

  List<cryptoMoeda> get cryptos => _cryptos;
  bool get isLoading => _isLoading;

  HomeViewModel(this.repository);

  Future<void> fetchCryptos([String? symbolsInput]) async {
    _isLoading = true;
    notifyListeners();

    try {
      final symbols = symbolsInput?.isNotEmpty == true
          ? symbolsInput!.split(',').map((e) => e.trim().toUpperCase()).toList()
          : ['BTC', 'ETH', 'LTC'];
      _cryptos = await repository.getCryptosBySymbols(symbols);
      notifyListeners();
      // Agora busca BRL
      await repository.updateCryptosWithBrl(_cryptos);
    } catch (e) {
      _cryptos = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}