//AlzaSyCuTilAfnGfkZtlx0T3qf-eOmWZ_N2LpOY
import 'package:flutter/material.dart';
import 'package:google_maps_app_flutter/widgets/custom_google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMaps(),
    );
  }
}

