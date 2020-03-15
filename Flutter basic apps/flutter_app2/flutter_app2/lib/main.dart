import 'package:flutter/material.dart';

 void main(){
   runApp(new App());
 }
 class App extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return new MaterialApp(
       title: "My Application",
       home: new Scaffold(
         appBar: new AppBar(title: new Text("Row & Column"),),
         body: new Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new Text("This"),
             new Column(
               mainAxisAlignment: MainAxisAlignment.center,

               children: <Widget>[
                 new Text("A1"),
                 new Text("A2"),
                 new Text("A3"),

               ],
             ),
             new Text("is"),
             new Text("Row"),
           ],
         ),
       )
     );
   }
 }
