class Event {
    final DateTime datetime;
    final String type;
    final double latitude;
    final double longitude;
    final double distance;
    final String desc;
    final double size;

    Event({
        required this.datetime,
        required this.type,
        required this.latitude,
        required this.longitude,
        required this.distance,
        required this.desc,
        required this.size,
    });


    @override
  String toString() {
   return '''
    datetime: $datetime,
    type: $type,
    latitude: $latitude,
    longitude: $longitude,
    distance: $distance,
    desc: $desc,
    size: $size,
    ''';
  }

}