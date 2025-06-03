import 'package:flutter/material.dart';
import '../models/cryptocurrency.dart';

class CryptoDetailSheet extends StatelessWidget {
  final Cryptocurrency crypto;

  const CryptoDetailSheet({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final greenColor = Colors.green.shade700;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            children: [
              Icon(Icons.monetization_on, color: greenColor),
              const SizedBox(width: 8),
              Text(
                crypto.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: greenColor,
                ),
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(crypto.symbol),
                backgroundColor: greenColor.withOpacity(0.1),
                labelStyle: TextStyle(color: greenColor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InfoTile(
            icon: Icons.calendar_today,
            label: 'Adicionado em',
            value: crypto.dateAdded.toLocal().toString().split(' ')[0],
          ),
          const SizedBox(height: 12),
          _InfoTile(
            icon: Icons.attach_money,
            label: 'Preço USD',
            value: '\$${crypto.priceUsd.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 12),
          _InfoTile(
            icon: Icons.money,
            label: 'Preço BRL',
            value: crypto.priceBrl != null
                ? 'R\$${crypto.priceBrl!.toStringAsFixed(2)}'
                : '---',
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final greenColor = Colors.green.shade800;

    return Row(
      children: [
        Icon(icon, size: 20, color: greenColor),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.w600, color: greenColor),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
