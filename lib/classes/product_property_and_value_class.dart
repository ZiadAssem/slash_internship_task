// product_property_and_value.dart
class ProductPropertyAndValue {
  final String property;
  final String value;

  ProductPropertyAndValue({
    required this.property,
    required this.value,
  });

  factory ProductPropertyAndValue.fromJson(Map<String, dynamic> json) {
    print('test');
    print('property: ${json['property']}');
    print('value: ${json['value']}');
    if(json['property'] == null){
      print('property is null');
    } else
    if(json['value'] == null){
      print('value is null');
    } else{
      print('all is well 3');
    }

    String value='';
    if(json['value']!=null){
      value=json['value'];
    }
    return ProductPropertyAndValue(
      property: json['property'],
      value: value,
    );
  }
}
