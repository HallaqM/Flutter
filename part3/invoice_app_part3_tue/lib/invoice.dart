// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:invoice_app/product.dart';

class Invoice {
  int invoiceNo;
  String cName;
  List<Product> products;
  Invoice({
    required this.invoiceNo,
    required this.cName,
    required this.products,
  });

  @override
  String toString() {
    String res = '';
    int totalQuantity = 0;
    double totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      res += '${i + 1}- ${products[i].toString()}\n';
      totalQuantity += products[i].quantity;
      totalPrice += products[i].quantity * products[i].price;
    }
    res += '\n\n\nTotal Price: $totalPrice\nTotal Quantity: $totalQuantity';
    return res;
  }
}
