import 'package:flutter/material.dart';
import '../models/cryptocurrency.dart';

class CryptoDetailSheet extends StatelessWidget {
  final Cryptocurrency crypto;

  const CryptoDetailSheet({required this.crypto, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: ${crypto.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 8),
          Text('Símbolo: ${crypto.symbol}'),
          SizedBox(height: 8),
          Text('Data de Adição: ${crypto.dateAdded.toLocal().toString().split(' ')[0]}'),
          SizedBox(height: 8),
          Text('Preço USD: \$${crypto.priceUsd.toStringAsFixed(2)}'),
          SizedBox(height: 8),
          Text('Preço BRL: ${crypto.priceBrl != null ? 'R\$${crypto.priceBrl!.toStringAsFixed(2)}' : '---'}'),
        ],
      ),
    );
  }
}