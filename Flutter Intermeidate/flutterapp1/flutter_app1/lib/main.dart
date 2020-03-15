import 'package:flutter/material.dart';

import './product_manager.dart';


void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.purple,
          brightness: Brightness.light
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('EasyList'),
          ),
          body: ProductManager(startingProduct: 'Food Tester')
      ),
      );
  }
}

