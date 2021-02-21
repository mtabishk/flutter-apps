import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: MyGoogleMap(),
    theme: ThemeData.dark(),
  ));
}

class MyGoogleMap extends StatefulWidget {
  MyGoogleMap({Key key}) : super(key: key);

  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  // variables for latitude and longitude
  var lat = 34.106639;
  var lng = 74.6666695;

  lw() async {
    var p = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    lat = p.latitude;
    lng = p.longitude;
    print(p);
  }

  @override
  Widget build(BuildContext context) {
    var cp = CameraPosition(target: LatLng(lat, lng), zoom: 19, tilt: 50);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map App'),
      ),
      body: GoogleMap(
        initialCameraPosition: cp,
        mapType: MapType.hybrid,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lw,
        child: Icon(Icons.zoom_out_map),
      ),
    );
  }
}
