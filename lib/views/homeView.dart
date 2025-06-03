import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/homeViewmodel.dart';
import '../widgets/cryptoSearchBar.dart';
import '../widgets/cryptoList.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<HomeViewModel>(context, listen: false).fetchCryptos(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Criptomoedas')),
      body: Column(
        children: [
          CryptoSearchBar(controller: _controller, onSearch: vm.fetchCryptos),
          Expanded(
            child: vm.isLoading
                ? Center(child: CircularProgressIndicator())
                : CryptoList(cryptos: vm.cryptos),
          ),
        ],
      ),
    );
  }
}
