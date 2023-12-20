import 'package:flutter/material.dart';
import 'data_model/data_model.dart';
import 'view/products.dart';

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
    return  MaterialApp(
      home:Container(),
      // ViewProducts(),
    );
  }
}
