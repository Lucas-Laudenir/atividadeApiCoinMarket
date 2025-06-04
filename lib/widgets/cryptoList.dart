import 'package:flutter/material.dart';
import '../models/cryptoMoeda.dart';
import 'cryptoDetail.dart';

class CryptoList extends StatelessWidget {
  final List<cryptoMoeda> cryptos;

  const CryptoList({super.key, required this.cryptos});

  @override
  Widget build(BuildContext context) {
    final green = Colors.green.shade600;

    return ListView.builder(
      itemCount: cryptos.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final crypto = cryptos[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tileColor: green.withOpacity(0.05),
            title: Text(
              '${crypto.name} (${crypto.symbol})',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.attach_money, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(
                      'USD: \$${crypto.priceUsd.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
                if (crypto.priceBrl != null)
                  Row(
                    children: [
                      const Icon(Icons.money, size: 16, color: Colors.black54),
                      const SizedBox(width: 4),
                      Text(
                        'BRL: R\$${crypto.priceBrl!.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                isScrollControlled: true,
                builder: (_) => CryptoDetail(crypto: crypto),
              );
            },
          ),
        );
      },
    );
  }
}
