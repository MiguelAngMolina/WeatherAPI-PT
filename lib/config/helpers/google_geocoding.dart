import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import 'package:weatherapi_gse/config/helpers/error_handling.dart';

class GeocodingService {
  final String apiKey = "AIzaSyBzQbX-pE23mwlksQB8DwCtcP7CAffKzv0";

  Future<LatLng?> searchAddress(String address) async {
    final url = "https://maps.googleapis.com/maps/api/geocode/json";

    try {
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
    } catch (e){
      throw ApiException('Error inesperado, vuelve atrás y vuelve a intentarlo :D : $e');
    }
  }
}
