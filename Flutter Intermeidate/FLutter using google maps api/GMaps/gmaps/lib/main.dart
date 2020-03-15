import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Pune"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(context),
        ],
      ),
    );
  }
Widget _zoomminusfunction()
{
  return Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      icon:Icon(FontAwesomeIcons.searchMinus),
      color: Colors.teal,
      onPressed: ()
      {
        zoomVal--;
        _minus(zoomVal);

      },
    ),
  );
}

  Widget _zoomplusfunction()
  {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon:Icon(FontAwesomeIcons.searchPlus),
        color: Colors.teal,
        onPressed: ()
        {
          zoomVal++;
          _plus(zoomVal);

        },
      ),
    );
  }

  Widget _googleMap(BuildContext context)
  {
    return Container(
     // height: MediaQuery.of(context).size.height,
     // width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(18.5204, 73.8567),zoom: 12),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: {
          puneMarker,
          puneMarker1
        },
      ),
    );
  }
  Widget _buildContainer(BuildContext context)
  {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),

              ),

            ],
          ),
      ),
    );
  }
  Widget _boxes(String image,double lat,double long,String resName){
    return GestureDetector(
      onTap: (){
        _goToLocation(lat,long);

      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer(resName),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget myDetailsContainer(String resn)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(resn,
            style:TextStyle(
              color: Colors.red,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,

            ),
            ),

          ),

        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "4.1",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,

                  ),
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),

              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,

                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,

                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,

                ),
              ),Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,

                ),
              ),
              Container(
                child: Text(
                  "(946)",
                  style: TextStyle(
                    color:Colors.black54,
                    fontSize: 18.0,

                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0,),
        Container(
          child: Text(
            "Indulge in a 5-star stay at our Koregoan Park, Pune hotel",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,

            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Container(
          child: Text(
            "Breakfast and parking are included. There are 3 restaurants, 2 bars and a deli. Other amenities consist of a spa, a fitness room and an outdoor pool.",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,

            ),
          ),
        ),
      ],
    );
  }
  Future<void> _goToLocation(double lat,double long) async{
    final GoogleMapController controller=await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(lat,long) ,
              zoom: 15.0,
              tilt: 50.0,
              bearing : 45.0,
    )
    )
    );


  }

  Future<void> _minus(double zoomVal) async{
    final GoogleMapController googleMapController= await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(18.5392, 73.9063),zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async{
    final GoogleMapController googleMapController= await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(18.5392, 73.9063),zoom: zoomVal)));
  }
}





Marker puneMarker=Marker(
  markerId: MarkerId( "pune1" ),
  position: LatLng(18.5392, 73.9063),
  infoWindow: InfoWindow(title: 'Westin Hotel'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  )
);


Marker puneMarker1=Marker(
    markerId: MarkerId( "pune2" ),
    position: LatLng(18.5324, 73.8298),
    infoWindow: InfoWindow(title: 'JW Marriot'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    )
);

