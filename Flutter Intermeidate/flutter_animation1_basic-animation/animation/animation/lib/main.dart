import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}





class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation _animation,child,deanimation,ddanimation;
  AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(duration: Duration(seconds: 5),vsync: this);
    _animation=Tween(begin: -0.25,end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn
    ));
    /*deanimation=Tween(begin: -1.0,end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5,1.0,curve: Curves.fastOutSlowIn)
      )

    );
    ddanimation=Tween(begin: -1.0,end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.8,1.0,curve: Curves.fastOutSlowIn)
        )
    );*/
    child=Tween(begin: 20.0,end: 125.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn
      )
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return  AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context,Widget child){
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(_animation.value *width,0.0,0.0),
                      child: new Container(

                        child: Center(
                            child:Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,



                                  children: <Widget>[
                                    Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),


                                  ],
                                ),
                              ),
                            )




                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(deanimation.value *width,0.0,0.0),
                      child: new Container(

                        child: Center(
                            child:Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,



                                  children: <Widget>[

                                    TextField(
                                      decoration: InputDecoration(hintText: "Username"),



                                    ),
                                    TextField(
                                      decoration: InputDecoration(hintText: "Password"),

                                    ),

                                  ],
                                ),
                              ),
                            )




                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(ddanimation.value *width,0.0,0.0),
                      child: new Container(

                        child: Center(
                            child:Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,



                                  children: <Widget>[

                                    RaisedButton(
                                      child: Text('Login',textAlign: TextAlign.center,),
                                      color: Colors.blue,
                                      splashColor: Colors.lightBlueAccent,
                                      onPressed: (){

                                      },

                                    ),
                                    RaisedButton(
                                      child: Text("Don't have an account?",textAlign: TextAlign.center,),
                                      color: Colors.grey,
                                      disabledElevation: 2.0,


                                      onPressed: (){


                                      },

                                    ),
                                    RaisedButton(
                                      child: Text('Signup',
                                        textAlign: TextAlign.center, ),
                                      color: Colors.white,
                                      textColor: Colors.lightGreen,
                                      splashColor: Colors.green,
                                      onPressed: (){

                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )




                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

