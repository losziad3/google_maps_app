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
   initialCameraPosition = const CameraPosition(target: LatLng(30.044920714694886, 31.236492632728453));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}

// Zoom
// World View 0 --> 3
// Country View 4 --> 6
// City View 10 --> 12
