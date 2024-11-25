import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mid_flutter/data/data.dart';
import 'package:mid_flutter/main.dart';
import 'package:mid_flutter/model/studant.dart';
import "package:http/http.dart" as http;

class Loadingpage extends StatefulWidget {
  const Loadingpage({Key? key}) : super(key: key);

  @override
  _LoadingpageState createState() => _LoadingpageState();
}

class _LoadingpageState extends State<Loadingpage> {
  Future<List<Studant>> getStudant() async {
    final resposne = await http
        .get(Uri.parse("https://mahmoud02.wiremockapi.cloud/getStudant"));
    if (resposne.statusCode == 200) {
      var jsonArray = jsonDecode(resposne.body)['data'] as List;
    return  jsonArray.map((e) => Studant.fj(e)).toList();
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    getStudant().then((value) {
      studantList = value;
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
