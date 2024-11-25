import 'package:firstapp/main.dart';
import 'package:firstapp/models/invoce.dart';
import 'package:firstapp/models/product.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

TextEditingController cNameController = TextEditingController();
TextEditingController pNameController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController priceController = TextEditingController();

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title:const Text("Products app",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold),
            )
          ),
          body:Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   const SizedBox(height: 50,),
                  Text("Products: "),
                  ElevatedButton(onPressed: () {
                    showDialog(context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Product Info"),
                      content: SingleChildScrollView(
                        child:Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: pNameController,
                              decoration: InputDecoration(
                                labelText: "Product Name",
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: quantityController,
                              decoration: InputDecoration(
                                labelText: "Quantity"
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: priceController,
                              decoration: InputDecoration(
                                labelText: "Price",
                              ),
                            )
                          ],
                        ),
                      ),
                  actions: [
                          ElevatedButton(
                              onPressed: () {
                                try {
                                  setState(() {
                                    products.add(Product(
                                        name: pNameController.text,
                                        quantity:
                                            int.parse(quantityController.text),
                                        price: double.parse(
                                            priceController.text)));
                                  });
                                  pNameController.clear();
                                  quantityController.clear();
                                  priceController.clear();
                                  Navigator.pop(context);
                                } catch (e) {
                                  SnackBar snackBar = SnackBar(
                                      content: Text(
                                          'please fill all fields correctly'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text('add')),   
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text("Cancel"))          
                ]),
                );
                  
                  }, child: Text("Add Product"))
                ],
              ),
              Expanded(
             
              child:ListView.builder(itemCount: products.length,itemBuilder:(context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.blue,
                    leading: Text(products[index].name),
                    title: Text('price: ${products[index].price}' ),
                    subtitle: Text('quantity: ${products[index].quantity}'),
                    trailing: IconButton(onPressed: () {
                      setState(() {
                        products.removeAt(index);
                      });
                    }, icon:const Icon(Icons.delete_forever))
                  ),
                );
              }, 
              ) 
              )

              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    invoices.add(Invoice(
                        invoiceNo: InvoiceApp.invoiceNo,
                        cName: cNameController.text,
                        products: products));
                    InvoiceApp.invoiceNo++;
                    cNameController.clear();
                    products = [];
                    setState(() {});
                  },
                  child: Text('add invoice')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/invoices_page');
                  },
                  child: Text('show all invoices')),
            ],
              ),
              
            
                 ]) );
                 
        
  }
}