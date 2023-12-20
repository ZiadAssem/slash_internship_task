// product_variation.dart
import 'product_property_and_value_class.dart';

class ProductVariation {
  final int id;
  final int productId;
  final num price;
  final int quantity;
  bool inStock; // to enable/disable addToCart button
  final List<String> productVariantImages;
  final List<ProductPropertyAndValue> productPropertiesValues;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVariantImages,
    required this.productPropertiesValues,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json, int productId) {
    if(json['id'] == null){
      print('id is null');
    }else
    if(json['price'] == null){
      print('price is null');
    }else
    if(json['quantity'] == null){
      print('quantity is null');
    }else
    if(json['inStock'] == null){
      print('inStock is null');
    }else
    if(json['ProductVarientImages'] == null){
      print('ProductVarientImages is null');
    }else
    if(json['productPropertiesValues'] == null){
      print('productPropertiesValues is null');
    }else
    
    {
      print('all is well 2');
    }
   







   List<ProductPropertyAndValue> propertiesValues = [];
    List<String> productVariantImages = [];

    if (json['productPropertiesValues'] != null) {
      print(json['productPropertiesValues']==null);
      propertiesValues = (json['productPropertiesValues'] as List<dynamic>?)
          ?.map<ProductPropertyAndValue>(
              (property) => ProductPropertyAndValue.fromJson(property))
          .toList() ?? [];
      print(propertiesValues);
      print('succes 1');
    } else {
      print('Warning: ProductPropertiesValues list is null.');
    }

    if (json['ProductVarientImages'] != null) {
      productVariantImages = (json['ProductVarientImages'] as List<dynamic>?)
          ?.map<String>((image) => image['image_path'] as String)
          .toList() ?? [];
      print(productVariantImages);
      print('succes 2');
    } else {
      print('Warning: ProductVarientImages list is null.');
    }
    // Find the specific variation in the variations array
    // Map<String, dynamic> variationJson = (json['variations'] as List<dynamic>)
    //     .firstWhere(
    //       (variation) => variation['id'] == json['id'],
    //       orElse: () => Map<String, dynamic>(),
    //     );

    return ProductVariation(
      id: json['id'],
      productId: productId,
      price: json['price'],
      quantity: json['quantity'] ,
      inStock: json['inStock'] ?? false,
      productVariantImages: productVariantImages,
      productPropertiesValues: propertiesValues,
    );
  }
}
