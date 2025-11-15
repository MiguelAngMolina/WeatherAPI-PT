import 'package:weatherapi_gse/domain/entities/day.dart';

class Report {
  final String? location;
  final double latitude;
  final double longitude;
  final List<Day> days;

  Report({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.days,
  });

  @override
  String toString() {
    return '''
      location: $location, 
      latitude: $latitude, 
      longitude: $longitude, 
      days: ${days.toString()})
    ''';
  }
}
