import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/infrastructure/models/reports_response.dart' hide Day;

class ReportMapper {
  static Report reportResponsetoEntity(ReportResponse report) => Report(
    location: report.address,
    latitude: report.latitude,
    longitude: report.longitude,
    days: report.days
    .map((e) => Day(
        datetime: e.datetime,
        tempmax: e.tempmax,
        tempmin: e.tempmin,
        tempavg: e.temp,
        feelslimax: e.feelslikemax,
        feelslikemin: e.feelslikemin,
        feelslikeavg: e.feelslike,
        humidity: e.humidity,
        precipprob: e.precipprob,
        preciptype: e.preciptype,
        snowdepth: e.snowdepth,
        windspeed: e.windspeed,
        winddir: e.winddir,
        pressure: e.pressure,
        cloudcover: e.cloudcover,
        visibility: e.visibility,
        uvindex: e.uvindex,
        severerisk: e.severerisk,
        sunrise: e.sunrise,
        sunset: e.sunset,
        moonphase: e.moonphase,
        conditions: e.conditions,
        description: e.description,
        icon: e.icon,
      )).toList()
  );
}
