import 'package:flutter/material.dart';
import 'data_model/data_model.dart';

void main() async{
  DataModel model = DataModel();
 final products=await model.fetchAllProducts();
  print(products);


   runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
