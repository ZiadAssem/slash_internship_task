import 'product_variation_class.dart';
import 'product_property_and_value_class.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String? brandName;
  final String? brandLogoUrl;
  final double rating;
  final List<ProductVariation> variations;
  final List<ProductPropertyAndValue>
      availableProperties; //What properties are offered //(multiple colors or non, multiple sizes or non, materials)

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
    List<ProductPropertyAndValue> availableProperties = [];
    List<ProductVariation> variations =[];
    if(json['available_properties'] != null) {
     availableProperties =json['available_properties']
          .map<ProductPropertyAndValue>(
              (property) => ProductPropertyAndValue.fromJson(property))
          .toList();
    }
    
    if(json['variations'] != null) {
      variations =json['variations']
          .map<ProductVariation>(
              (variation) => ProductVariation.fromJson(variation, json['id']))
          .toList();
    }

    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brandId: json['brand_id'],
      brandName: json['brandName'],
      brandLogoUrl: json['brandImage'],
      rating: json['product_rating'],
      variations:variations,
      availableProperties:availableProperties ,
    );

    
  }
}
