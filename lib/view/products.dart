import 'package:flutter/material.dart';

import '../classes/product_class.dart';
import '../data_model/data_model.dart';

class ViewProducts extends StatefulWidget {
  const ViewProducts({super.key});

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //set title to be in middle
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Slash.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        
        ),
      ),
      backgroundColor: Colors.black,
      body: _productsGrid(),
    );
  }
  
  Widget _productsGrid() {
    return FutureBuilder(
      future: DataModel().fetchAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<Product>;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              print('test');
              print('name is ${products}');
              return _productCard(products[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  Widget _productCard(Product product) {
    return Card(
      child: Column(
        //Product image
        children: [
          // Expanded(
          //   child: Image.network(
          //     product.variations[0].productVariantImages[0],
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // //Product name
          // Text(
          //   product.name,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          //Product price
          Text(
            'Rs. ${product.variations[0].price}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}