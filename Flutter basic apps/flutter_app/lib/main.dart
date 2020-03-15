import 'package:flutter/material.dart';

void main() {
  runApp(new Application());
}


/*class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Stateless Widget',
      home: new Scaffold(
        body: new Container(
      color: Colors.pink,
      child: new Container(
        color: Colors.yellow,
        child: new Container(
          color: Colors.blue,
          margin: const EdgeInsets.all(30.0),
          
        ),
        margin: const EdgeInsets.all(30.0),
      ),
    )
      ),
    );
}
}*/
class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  String titletxt=" ";
  @override
  void initState() {
    // TODO: implement initState
    titletxt="Click on this button";
    super.initState();
  }
  void method1(){
    setState(() {
      titletxt="The text is been changed";
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Statefull Widget",
      home: new Scaffold(
        body: new Center(
          child: new RaisedButton(onPressed: (){method1();},child: new Text(titletxt),),
        ),
      ),
    );
  }
}



