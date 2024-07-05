import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});
}
List<PlaceModel> places = [
  PlaceModel(id: 1, name: 'الاكاديمية المصرية للطيران', latLng: LatLng(30.121066176319243, 31.403414851630643)),
  PlaceModel(id: 2, name: 'باركينج الركب الطائر', latLng: LatLng(30.12332121211006, 31.404412633345192)),
  PlaceModel(id: 3, name: '  فندق نوفوتيل مطار القاهرة', latLng: LatLng(30.12125433933255, 31.402012976872435)),
];