class Day {
  final DateTime datetime;
  final double tempmax;
  final double tempmin;
  final double tempavg;
  final double feelslikeavg;
  final double humidity;
  final double precipprob;
  final double windspeed;
  final double pressure;
  final double cloudcover;
  final double visibility;
  final double uvindex;
  final String sunrise;
  final String sunset;
  final String conditions;
  final String description;


  Day({
    required this.datetime,
    required this.tempmax,
    required this.tempmin,
    required this.tempavg,
    required this.feelslikeavg,
    required this.humidity,
    required this.precipprob,
    required this.windspeed,
    required this.pressure,
    required this.cloudcover,
    required this.visibility,
    required this.uvindex,
    required this.sunrise,
    required this.sunset,
    required this.conditions,
    required this.description,
  });


  @override
  String toString() {
    return '''

        datetime: $datetime,
        tempmax: $tempmax,
        tempmin: $tempmin,
        tempavg: $tempavg,
        feelslikeavg: $feelslikeavg,
        humidity: $humidity,
        precipprob: $precipprob,
        windspeed: $windspeed,
        pressure: $pressure,
        cloudcover: $cloudcover,
        visibility: $visibility,
        uvindex: $uvindex,
        sunrise: $sunrise,
        sunset: $sunset,
        conditions: $conditions,
        description: $description,
  ''';
  }
}
