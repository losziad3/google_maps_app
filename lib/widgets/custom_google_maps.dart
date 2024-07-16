import 'package:flutter/material.dart';
import 'package:google_maps_app_flutter/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      zoom: 12,
      target: LatLng(30.044920714694886, 31.236492632728453),
    );
    initMarkers();

    initPolyLines();

    initCircles();
    super.initState();
  }


  void initMarkers(){
   var myMarkers = places.map((placeModel)=>Marker(
     infoWindow: InfoWindow(
       title: placeModel.name,
     ),
      position: placeModel.latLng,
      markerId: MarkerId(placeModel.id.toString(),),),).toSet();
   markers.addAll(myMarkers);
  }
  late GoogleMapController googleMapController;

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  // 1. Load String
  // 2. Make Google Maps Update the Style
   void initMapStyle()async{
     var nightMapStyle = await DefaultAssetBundle.of(context).loadString('assets/map_styles/night_map_style.json');
     googleMapController.setMapStyle(nightMapStyle);
   }

  void initPolyLines() {
    Polyline polyline = Polyline(polylineId: PolylineId('1'),
    color: Colors.green,
    startCap: Cap.roundCap,
    width: 5,
    points: [
      LatLng(30.04426919441919, 31.263294192187523),
      LatLng(30.065353994381855, 31.347258775928847),
      LatLng(30.02078651152527, 31.38146657089138),
      LatLng(29.970362224797537, 31.241180062846027),

    ],
    );
    polyLines.add(polyline);
  }

  void initCircles(){
    Circle circle = Circle(circleId: CircleId('1'),
    center: LatLng(30.050340856334916, 31.237762872925575),
      radius: 1000,
    );
    circles.add(circle);
  }

   Set<Marker> markers={};
   Set<Polyline> polyLines = {};
   Set<Circle> circles = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          circles: circles,
          polylines: polyLines,
          zoomControlsEnabled: false,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            // I call the function here because I want to initialize google map controller to use it in Google Style
            // initMapStyle();
          },
          initialCameraPosition: initialCameraPosition,
        ),
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: ElevatedButton(
          onPressed: ()
          {

            googleMapController.animateCamera(CameraUpdate.newLatLng(LatLng(31.559633623197193, 31.087435736395896)));
          },
          child: Text('Change Location'),
        ),),
      ],
    );
  }


}

// Zoom
// World View 0 --> 3
// Country View 4 --> 6
// City View 10 --> 12
// Street View 13 --> 17
// Building View 18 --> 20
