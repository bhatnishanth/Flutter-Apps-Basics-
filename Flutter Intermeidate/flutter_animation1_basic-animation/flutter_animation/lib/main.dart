import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(Ani());

class Ani extends StatefulWidget {
  @override
  _AniState createState() => _AniState();
}

class _AniState extends State<Ani> with SingleTickerProviderStateMixin {


  Animation<double> _animation;
  AnimationController _controller;
  Tween _tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 5));
    _tween=new Tween<double>(begin: 100.0,end: 320.0);
    _animation=_tween.animate(_controller);
    _animation.addListener((){
      setState() {}
    });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: _animation.value,
            left: 50.0,
            child: ScaleTransition(
              scale: _controller,
              child: Icon(FontAwesomeIcons.solidStar,color: Colors.amber,size: 40.0,),
            ),
          ),
        ],
      ),
    );
  }
}
