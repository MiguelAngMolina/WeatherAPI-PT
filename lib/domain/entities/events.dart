class Event {
    final String location;
    final DateTime datetime;
    final String type;
    final double latitude;
    final double longitude;
    final double distance;
    final String desc;

    Event({
        required this.location,
        required this.datetime,
        required this.type,
        required this.latitude,
        required this.longitude,
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
    longitude: $longitude,
    distance: $distance,
    desc: $desc,
    }
    ''';
  }

}