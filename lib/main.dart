import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/homeView.dart';
import 'viewmodels/homeViewmodel.dart';
import 'repositories/cryptoRepository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(CryptoRepository()),
      child: MaterialApp(home: HomeView()),
    );
  }
}
