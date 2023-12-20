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
        debugPrint('requests successful');
        List<Product> products = [];

        // for (var product in response.data['data']) {
        //   print(product['id']);
          // final productResponse = await dio.get('$apiUrl/${product['id']}');
          final productResponse = await dio.get('$apiUrl/22');
          print(productResponse.data['data']);
          products.add(Product.fromJson(productResponse.data['data']));
        // }
        return products;
      } else {
        debugPrint('requests failed');
        throw Exception('Failed to load products');
      }
    } on Exception catch (e) {
      print('Exception: ${e.toString()}');
      // TODO
    }
    return [];
  }
}
