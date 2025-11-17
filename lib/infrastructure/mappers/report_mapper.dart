import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/infrastructure/models/reports_response.dart';


class ReportMapper {
  static Report reportResponsetoEntity(ReportResponse report) => Report(
    location: report.resolvedAddress,
    latitude: report.latitude,
    longitude: report.longitude,
    days: report.days
    .map((e) => Day(
        datetime: e.datetime,
        tempmax: e.tempmax,
        tempmin: e.tempmin,
        tempavg: e.temp,
        feelslikeavg: e.feelslike,
        humidity: e.humidity,
        precipprob: e.precipprob,
        windspeed: e.windspeed,
        pressure: e.pressure,
        cloudcover: e.cloudcover,
        visibility: e.visibility,
        uvindex: e.uvindex,
        sunrise: e.sunrise,
        sunset: e.sunset,
        conditions: e.conditions,
        description: e.description,
        icon: e.icon,
        events: e.events
          ?.map((event) => Event(
            location: report.address,
            datetime: event.datetime, 
            type: event.type, 
            latitude: event.latitude, 
            reportlat: report.latitude,
            longitude: event.longitude, 
            reportlong: report.longitude,
            distance: event.distance, 
            desc: event.desc, 
            )).toList()
      )).toList()
  );
}
