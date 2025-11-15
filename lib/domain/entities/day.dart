class Day {
  final DateTime datetime;
  final int tempmax;
  final int tempmin;
  final double tempavg;
  final int feelslimax;
  final int feelslikemin;
  final double feelslikeavg;
  final double humidity;
  final int precipprob;
  final List<String> preciptype;
  final int snowdepth;
  final double windspeed;
  final double winddir;
  final double pressure;
  final double cloudcover;
  final double visibility;
  final int uvindex;
  final int severerisk;
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
}
