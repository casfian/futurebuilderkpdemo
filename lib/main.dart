import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//kita jadikan sebagai object supaya mudah guna

void main() => runApp(MyApp());

//root class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

//secondary class
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List posts = [];

  //kita akan guna data dari URL ne
  //data source
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

  //buat function
  Future getPosts() async {
    var data = await http.get(url);
    var jsonData = json.decode(data.body); //data akan diterjemah ke JSON
    print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
