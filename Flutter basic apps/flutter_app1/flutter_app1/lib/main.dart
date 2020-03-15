import 'package:flutter/material.dart';

void main(){
runApp(new App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(

          child: new Text("This is my Conatainer"),
          height: 300,
          width: 300,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            color: Colors.green,

          ),
          foregroundDecoration: new BoxDecoration(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
