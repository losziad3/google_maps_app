import 'package:flutter/material.dart';
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

    super.initState();
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
            // I call the function here because I want to initialize google map controller to use it in Google Style
            initMapStyle();
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
