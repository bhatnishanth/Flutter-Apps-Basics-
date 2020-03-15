import 'package:flutter/material.dart';

void main()
{
  runApp(new appBar());
}
class appBar extends StatefulWidget {
  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {

  String mtxt="";
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        leading: new Icon(Icons.menu),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.arrow_forward), onPressed:(){setState(() {
        mtxt='This arrow icon button';
          });
          }),
          new IconButton(icon: new Icon(Icons.close), onPressed:(){setState(() {
            mtxt='This arrow icon button';
          });
          }),
        ],
        elevation: 30.0,
        title: new Text("My AppBar"),
        centerTitle: true,
      ),
        body: new Center(
          child: new Text(mtxt),
        ),
    ),
    );
  }
}
