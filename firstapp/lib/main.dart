import 'package:firstapp/models/invoce.dart';
import 'package:firstapp/models/product.dart';
import 'package:firstapp/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {runApp(const MyApp());
}

List<Invoice> invoices=[];
List<Product> products=[];
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      initialRoute: '/',
      routes: {
        '/':(context)=>const MainScreen(),
        
      },
    );
  
  }
}
