import 'package:flutter/material.dart';
import 'package:mid_flutter/data/data.dart';
import 'package:mid_flutter/main.dart';
import 'package:mid_flutter/model/studant.dart';

class NewStudant extends StatefulWidget {
  const NewStudant({Key? key}) : super(key: key);

  @override
  _NewStudantState createState() => _NewStudantState();
}

class _NewStudantState extends State<NewStudant> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new studant"),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, icon: Icon(Icons.arrow_back))],
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: "Id"),
          ),
          Center(
            child: ElevatedButton(onPressed: () {
              if(nameController.text.isNotEmpty &&idController.text.isNotEmpty){
              studantList.add(Studant(name: nameController.text, id: idController.text, marks: []));

              }
            }, child: Text("add")),
          )
        ],
      ),
    );
  }
}
