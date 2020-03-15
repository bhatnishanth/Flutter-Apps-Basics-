import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Padding(
      padding: EdgeInsets.only(left: 8.0, top: 40.0,right: 8.0),
      child: Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Card(
            child: Padding(
              padding:  EdgeInsets.all(24.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person,textDirection: TextDirection.ltr,),
                    onPressed: (){
                      print("Person");
                    },
                  ),
                  Text("A",textDirection: TextDirection.ltr,),

      Expanded(
        child: Text("B",textDirection: TextDirection.ltr,),
      ),
      IconButton(
        icon: Icon(Icons.add,textDirection: TextDirection.ltr,),
        onPressed: (){
          print("add");
        },
      )
                ],
              ),
            ),
          ),
          Card(
            child:  Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person, textDirection: TextDirection.ltr,),
                    onPressed: (){
                      print("Person");
                    },
                  ),
                  Text("A1",textDirection: TextDirection.ltr,),
                  Expanded(
                    child: Text("B",textDirection: TextDirection.ltr,),
                  ),

                  IconButton(
                    icon: Icon(Icons.add,textDirection: TextDirection.ltr,),
                    onPressed: (){
                      print("add");
                    },
                  )
                ],
              ),
            ),
          ),
          Image(
          image: AssetImage("images/RML-2.jpg"),
          )
        ],
      ),
        ),
    );
  }
}

