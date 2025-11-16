import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

class GeocodingService {
  final String apiKey = "AIzaSyBzQbX-pE23mwlksQB8DwCtcP7CAffKzv0";

  Future<LatLng?> searchAddress(String address) async {
    final url = "https://maps.googleapis.com/maps/api/geocode/json";
    final response = await Dio().get(url, queryParameters: {
      "address": address,
      "key": apiKey,
    });

    final results = response.data["results"];
    if (results != null && results.isNotEmpty) {
      final loc = results[0]["geometry"]["location"];
      return LatLng(loc["lat"], loc["lng"]);
    }
    return null;
  }
}

