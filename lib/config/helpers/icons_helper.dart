import 'package:flutter/material.dart';

class WeatherIconsMapper {

  static IconData getIconWeather(String icon) {
    switch (icon) {
      case "snow":
        return Icons.ac_unit;

      case "rain":
        return Icons.water_drop_outlined; 

      case "fog":
        return Icons.blur_on;

      case "wind":
        return Icons.air;

      case "cloudy":
        return Icons.cloud;

      case "partly-cloudy-day":
        return Icons.cloud_queue;

      case "partly-cloudy-night":
        return Icons.nights_stay;

      case "clear-day":
        return Icons.wb_sunny;

      case "clear-night":
        return Icons.nightlight_round;

      default:
        return Icons.help_outline; 
    }
  }

  static IconData getIconEvent(String event) {
    switch (event) {

      case "hail": 
        return Icons.grain;  

      case "earthquake":
        return Icons.waves; 

      case "tornado":
        return Icons.cyclone; 

      case "wind": 
        return Icons.air; 

      default:
        return Icons.warning_amber_outlined; 

    }
  }


}
