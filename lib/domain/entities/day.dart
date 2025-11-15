class Day {
  final DateTime datetime;
  final double tempmax;
  final double tempmin;
  final double tempavg;
  final double feelslimax;
  final double feelslikemin;
  final double feelslikeavg;
  final double humidity;
  final double precipprob;
  final List<String> preciptype;
  final double snowdepth;
  final double windspeed;
  final double winddir;
  final double pressure;
  final double cloudcover;
  final double visibility;
  final double uvindex;
  final double severerisk;
  final String sunrise;
  final String sunset;
  final double moonphase;
  final String conditions;
  final String description;
  final String icon;

  Day({
    required this.datetime,
    required this.tempmax,
    required this.tempmin,
    required this.tempavg,
    required this.feelslimax,
    required this.feelslikemin,
    required this.feelslikeavg,
    required this.humidity,
    required this.precipprob,
    required this.preciptype,
    required this.snowdepth,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.cloudcover,
    required this.visibility,
    required this.uvindex,
    required this.severerisk,
    required this.sunrise,
    required this.sunset,
    required this.moonphase,
    required this.conditions,
    required this.description,
    required this.icon,
  });


  @override
  String toString() {
    return '''

        datetime: $datetime,
        tempmax: $tempmax,
        tempmin: $tempmin,
        tempavg: $tempavg,
        feelslimax: $feelslimax,
        feelslikemin: $feelslikemin,
        feelslikeavg: $feelslikeavg,
        humidity: $humidity,
        precipprob: $precipprob,
        preciptype: $preciptype,
        snowdepth: $snowdepth,
        windspeed: $windspeed,
        winddir: $winddir,
        pressure: $pressure,
        cloudcover: $cloudcover,
        visibility: $visibility,
        uvindex: $uvindex,
        severerisk: $severerisk,
        sunrise: $sunrise,
        sunset: $sunset,
        moonphase: $moonphase,
        conditions: $conditions,
        description: $description,
        icon: $icon,
  ''';
  }
}
