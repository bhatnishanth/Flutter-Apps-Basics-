import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp(),
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.lime,
          brightness: Brightness.dark
        ),
      ));
}
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkip = false;
  int gender=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER",textDirection: TextDirection.ltr,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.beenhere),
            onPressed: (){
              print("beenhere");
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("Add");
        },
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Username",

            ),
            onChanged: (input){
              print(input);
            },
          ),
          Checkbox(
          value: checkip,
            onChanged: (bool value){
            setState(() {
              print(value);
              checkip=value;
            });
            },

          ),
          ButtonBar(
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: gender,
                onChanged: (int gen){
                  setState(() {
                    print(gen);
                    gender=gen;
                  });
                },
              ),
              Radio(
                value: 2,
                groupValue: gender,
                onChanged: (int gen){
                  setState(() {
                    print(gen);
                    gender=gen;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
