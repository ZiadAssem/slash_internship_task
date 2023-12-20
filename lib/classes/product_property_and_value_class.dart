class ProductPropertyAndValue {
  final String property; //color, or size, or material
  final String
      value; //if property is color, value may be: #008000(hex for Green)
  //if property is size, value may be: XL

  ProductPropertyAndValue({
    required this.property,
    required this.value,
  });

  factory ProductPropertyAndValue.fromJson(Map<String, dynamic> json) {
    return ProductPropertyAndValue(
      property: json['property'],
      value: json['value'],
    );
  }

}
