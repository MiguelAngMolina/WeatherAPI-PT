import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final userLocationProvider =
    StateNotifierProvider<UserLocationNotifier, LatLng?>(
        (ref) => UserLocationNotifier());

class UserLocationNotifier extends StateNotifier<LatLng?> {
  UserLocationNotifier() : super(null);

  void setLocation(double lat, double lon) {
    state = LatLng(lat, lon); 
  }
}
