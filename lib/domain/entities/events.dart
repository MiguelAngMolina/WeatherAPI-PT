class Event {
    final String location;
    final DateTime datetime;
    final String type;
    final double latitude;
    final double reportlat;
    final double longitude;
    final double reportlong;
    final double distance;
    final String desc;

    Event({
        required this.location,
        required this.datetime,
        required this.type,
        required this.latitude,
        required this.reportlat,
        required this.longitude,
        required this.reportlong,
        required this.distance,
        required this.desc,
    });


    @override
  String toString() {
   return '''
    {
    location:$location,
    datetime: $datetime,
    type: $type,
    latitude: $latitude,
    reportlat: $reportlat
    longitude: $longitude,
    reportlong: $reportlong
    distance: $distance,
    desc: $desc,
    }
    ''';
  }

}