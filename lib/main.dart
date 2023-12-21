import 'package:flutter/material.dart';
import 'view/products.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewProducts(),
    );
  }
}
