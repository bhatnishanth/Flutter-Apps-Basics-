import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
void main(){

  runApp(
      MyApp()
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Maps',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),),
        backgroundColor: Colors.teal,
      ),
      body: MyMap(),
    )
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options:  MapOptions(
          center: LatLng(18.5204, 73.8567),
          zoom: 13.0
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoibmI3IiwiYSI6ImNrNjZqNzd4MjFoNDAzb3ExamZhbnJwMTkifQ.PCDRrU5Nsf__8VpBmQnZOw',
              'id': 'mapbox.streets'
            }
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(18.5204, 73.8567),
                builder: (ctx)=> Container(
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.mapMarkedAlt),
                    color: Colors.pink,
                    iconSize: 45.0,
                    onPressed: (){
                      showBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Container(
                              color: Colors.white,
                              child: Center(
                                child: Text('Bottom Sheet'),
                              ),

                            );

                          }
                      );

                    },
                  ),
                )
              )
            ],
          )

        ],
      ),
    );
  }
}
