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