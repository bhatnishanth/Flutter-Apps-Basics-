import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(
    MaterialApp(
      home: Myapp(),
    ),
    );

}
class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget androidLayout(){
    return RaisedButton(
      color: Colors.green,
      child: Text("ANDROID",textDirection: TextDirection.ltr,),
      onPressed: (){

      },

    );

  }

  Widget iosLayout(){
    return CupertinoButton(
      color: Colors.yellow,
      child: Text("IOS",textDirection: TextDirection.ltr,),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Andriod/IOS",textDirection: TextDirection.ltr,),
      ),
     body: Theme.of(context).platform == TargetPlatform.android
      ?
       androidLayout()
      :
         iosLayout()

    );
  }
}
