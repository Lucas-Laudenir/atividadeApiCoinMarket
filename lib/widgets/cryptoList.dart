import 'package:flutter/material.dart';
import '../models/cryptocurrency.dart';
import 'cryptoDetailSheet.dart';

class CryptoList extends StatelessWidget {
  final List<Cryptocurrency> cryptos;

  const CryptoList({required this.cryptos, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final crypto = cryptos[index];
        return ListTile(
          title: Text('${crypto.name} (${crypto.symbol})'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('USD: \$${crypto.priceUsd.toStringAsFixed(2)}'),
              if (crypto.priceBrl != null)
                Text('BRL: R\$${crypto.priceBrl!.toStringAsFixed(2)}'),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => CryptoDetailSheet(crypto: crypto),
            );
          },
        );
      },
    );
  }
}