import 'package:flutter/material.dart';

class CryptoBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CryptoBar({
    required this.controller,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final green = Colors.green.shade600;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: TextField(
          controller: controller,
          onSubmitted: onSearch,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: green),
              onPressed: () => onSearch(controller.text),
            ),
            hintText: 'Digite os símbolos (ex: BTC,ETH)',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: green.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: green, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
