import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          title: Text('Gestures',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.pink), ),
          centerTitle: true,
        ),
        body: MyHomePage(),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onLongPress: (){
          print('Clicked');
        },
        onTap: (){
          print('Clicked');
        },
        child: Container(

          height: 50.0,
          width: 100.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            color: Colors.limeAccent,

          ),
          child: Text('Click me'),
        ),
      ),

    );
  }
}

