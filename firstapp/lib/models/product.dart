import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String name;
  int quantity;
  double price;
  Product({
    required this.name,
    required this.quantity,
    required this.price,
  });
  
  

  @override
  String toString() => 'Product(name: $name, quantity: $quantity, price: $price)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
