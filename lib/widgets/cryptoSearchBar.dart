import 'package:flutter/material.dart';

class CryptoSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CryptoSearchBar({
    required this.controller,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Digite os símbolos (ex: BTC,ETH)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => onSearch(controller.text),
          ),
        ],
      ),
    );
  }
}