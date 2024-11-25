
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firstapp/models/product.dart';

class Invoice {
  int invoiceNo;
  String cName;
  List<Product> products;
  Invoice({
    required this.invoiceNo,
    required this.cName,
    required this.products,
  });
  
  
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoiceNo': invoiceNo,
      'cName': cName,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      invoiceNo: map['invoiceNo'] as int,
      cName: map['cName'] as String,
      products: List<Product>.from((map['products'] as List<int>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) => Invoice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Invoice(invoiceNo: $invoiceNo, cName: $cName, products: $products)';
  }
