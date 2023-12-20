import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../classes/product_class.dart';

class DataModel {
  Future<List<Product>> fetchAllProducts() async {
    try {
      String apiUrl = 'https://slash-backend.onrender.com/product';
      final dio = Dio();
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        debugPrint('Request successful');
        List<Product> products = [];

        for (var productData in response.data['data']) {

          try {
            final productId = productData['id'];
            print('Fetching product details for ID: $productId');
            final productResponse = await dio.get('$apiUrl/$productId');

            if (productResponse.statusCode == 200) {
              print(productResponse);
              final productDetails = productResponse.data['data'];
              print(productDetails);
              final Product product = Product.fromJson(productDetails);
              print('Product added');
              products.add(product);

            }
          } catch (e) {
            print('Error fetching product details: $e');
          }
         }

        return products;
      } else {
        debugPrint('Request failed');
        throw Exception('Failed to load products');
      }
    } on Exception catch (e) {
      debugPrint('Exception: ${e.toString()}');
      // Handle other exceptions
      throw Exception('Failed to load products: $e');
    }
  }
}
