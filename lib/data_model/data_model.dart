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
          products.add(Product.fromJson(productData));
         }
        return products;
      }
      }
    catch (e) {
      debugPrint('Request failed with error: $e');
      return [];
    }
    return [];
  }
}
