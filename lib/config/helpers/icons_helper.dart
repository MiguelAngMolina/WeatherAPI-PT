import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapi_gse/config/flavors/flavors.dart';

class WeatherIconsMapper {

  static Widget getWeatherIcon(String icon, {double size = 48, Color? color}) {
    if (F.appFlavor == Flavor.dev) {
      return Icon(
        _getIconData(icon),
        size: size,
        color: color ?? Colors.green.shade900,
      );
    } else {
      // prod: usamos assets
      return SvgPicture.asset(
        'assets/prod/$icon.svg',
        width: size,
        height: size,
        fit: BoxFit.contain,
      );
    }
  }

  static Widget getEventIcon(String event, {double size = 48, Color? color}) {
    if (F.appFlavor == Flavor.dev) {
      return Icon(
        _getEventIconData(event),
        size: size,
        color: color ?? Colors.green.shade900,
      );
    } else {
      return SvgPicture.asset(
        'assets/prod/$event.svg',
        width: size,
        height: size,
        
      );
    }
  }

  static IconData _getIconData(String icon) {
    switch (icon) {
      case "snow": return Icons.ac_unit;
      case "rain": return Icons.water_drop_outlined;
      case "fog": return Icons.blur_on;
      case "wind": return Icons.air;
      case "cloudy": return Icons.cloud;
      case "partly-cloudy-day": return Icons.cloud_queue;
      case "partly-cloudy-night": return Icons.nights_stay;
      case "clear-day": return Icons.wb_sunny;
      case "clear-night": return Icons.nightlight_round;
      default: return Icons.help_outline;
    }
  }

  static IconData _getEventIconData(String event) {
    switch (event) {
      case "hail": return Icons.grain;
      case "earthquake": return Icons.waves;
      case "tornado": return Icons.cyclone;
      case "wind": return Icons.air;
      default: return Icons.warning_amber_outlined;
    }
  }
}
