import 'package:flutter/material.dart';
import 'package:mid_flutter/model/studant.dart';
import 'package:mid_flutter/screen/loadingpage.dart';
import 'package:mid_flutter/screen/main_screen.dart';
import 'package:mid_flutter/screen/new_studant.dart';

void main() => runApp(MyApp());
List<Studant> studantList=[];
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      routes: {
        '/':(context)=>MainScreen(),
        '/addStudant':(context)=>NewStudant(),
        '/loading':(context)=>Loadingpage(),

      },
      initialRoute:"/loading",
    );
  }
}
