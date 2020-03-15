import 'package:flutter/material.dart';

void main() {
 runApp(
   MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text("Notification"),
       ),
       body: Myapp(),
     ),
   )
 );
}
class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  void showBottom(){
    showBottomSheet(context: context,
        builder: (builder){
      return Container(
        height: 100.0,
        color: Colors.orange,
        child: Center(
          child: Text("Botto modal sheet"),
        ),
      );
        }
    );

  }
  void showSnackBar(){
    final snackbar= SnackBar(
      content: Text("hi snack bar") ,
      action: SnackBarAction(
        label: "ok",
        onPressed: (){

        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
  Future<Null> showSimple() async{
    return showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("SImple dialog"),
        content: Text("The message you want"),
        actions: <Widget>[
          FlatButton(
            child: Text("DOne"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MaterialButton(
          child: Text("Snackbar"),
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.green,
          onPressed: (){
            showSnackBar();
          },
        ),
        MaterialButton(
          child: Text("Model"),
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.green,
          onPressed: (){
            showBottom();
          },

        ),
        MaterialButton(
          child: Text("SImple Dialog"),
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.green,
          onPressed: (){
            showSimple();
          },
        )
      ],
    );
  }
}
