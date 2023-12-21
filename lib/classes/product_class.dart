import 'package:slash_internship_task/classes/available_properties_class.dart';

import 'product_property_and_value_class.dart';
import 'product_variation_class.dart';

// product.dart

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String? brandName;
  final String? brandLogoUrl;
  final double rating;
  final List<ProductVariation> variations;
  final List<AvailableProperties> availableProperties;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    this.brandName,
    this.brandLogoUrl,
    required this.rating,
    required this.variations,
    required this.availableProperties,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      print('id is null');
    } else if (json['name'] == null) {
      print('name is null');
    } else if (json['description'] == null) {
      print('description is null');
    } else if (json['brand_id'] == null) {
      print('brand_id is null');
    } else if (json['brandName'] == null) {
      print('brandName is null');
    } else if (json['brandImage'] == null) {
      print('brandImage is null');
    } else if (json['product_rating'] == null) {
      print('product_rating is null');
    } else if (json['variations'] == null) {
      print('variations is null');
    } else if (json['avaiableProperties'] == null) {
      print('availableProperties is null');
    } else {
      print('all is well 1');
    }

    List<ProductVariation> variations = [];
    List<AvailableProperties> availableProperties = [];

    if (json['variations'] != null) {
      variations = (json['variations'] as List<dynamic>?)
              ?.map<ProductVariation>((variation) =>
                  ProductVariation.fromJson(variation, json['id']))
              .toList() ??
          [];
    } else {
      print('Warning: Variations list is null.');
    }

    if (json['avaiableProperties'] != null) {
      availableProperties = (json['avaiableProperties'] as List<dynamic>)
          .map<AvailableProperties>(
              (property) => AvailableProperties.fromJson(property))
          .toList();
    }
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brandId: json['brand_id'],
      brandName: json['brandName'],
      brandLogoUrl: json['brandImage'],
      rating: json['product_rating'].toDouble(),
      variations: variations,
      availableProperties: availableProperties,
    );
  }
}
