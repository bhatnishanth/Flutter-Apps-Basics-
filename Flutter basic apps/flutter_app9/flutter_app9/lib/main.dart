import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
       home: Myapp()
      ),
      );
}
class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView",textDirection: TextDirection.ltr,),

      ),
      body: GridView.count(crossAxisCount: 2,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: Text("1",textDirection: TextDirection.ltr,),

        ),
        Container(
          color: Colors.green,
          child: Text("2",textDirection: TextDirection.ltr,),

        ),
        Container(
          color: Colors.deepPurple,
          child: Text("3",textDirection: TextDirection.ltr,),

        )
      ],),

    );
  }
}
