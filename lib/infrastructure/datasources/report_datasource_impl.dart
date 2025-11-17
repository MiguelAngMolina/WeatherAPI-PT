import 'package:dio/dio.dart';
import 'package:weatherapi_gse/config/constants/environment.dart';
import 'package:weatherapi_gse/config/helpers/error_handling.dart';
import 'package:weatherapi_gse/domain/domain.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/infrastructure/mappers/report_mapper.dart';
import 'package:weatherapi_gse/infrastructure/models/reports_response.dart';

class ReportDatasourceImpl extends ReportDatasource{
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/',
    )
  );
  
  @override
  Future<Report> getReport(String location) async {
  try{
    final response = await dio.get(
      '$location/last2days',
      queryParameters: {
        "key": Environment.wheaterApiKey,
        "include": "days",
        "lang": "es",
        "unitGroup": "metric",
        "elements": "remove:stations"
      },
      );
      final reportResponse = ReportResponse.fromJson(response.data);
      // print("===== REPORT RESPONSE =====");
      // print(reportResponse.toJson());
      final Report report = ReportMapper.reportResponsetoEntity(reportResponse);
      return report;
    } catch (e) {
      throw ApiException('Error inesperado, vuelve atrás y vuelve a intentarlo :D : $e');
    }
  }
  
  @override
  Future<List<Event>> getEvents(String location, DateTime date1, DateTime date2)  async {
    try{
    final response = await dio.get(
      '$location/$date1/$date2',
      queryParameters: {
        "key": Environment.wheaterApiKey,
        "lang": "es",
        "include": "events",
        "unitGroup": "metric",
        "elements": "remove:stations"
      },
      );
      final reportResponse = ReportResponse.fromJson(response.data);
      final Report report = ReportMapper.reportResponsetoEntity(reportResponse);
      final events = report.days.expand<Event>((d) => d.events ?? []).toList();
      return events;


    } catch (e) {
      throw ApiException('Error inesperado, vuelve atrás y vuelve a intentarlo :D : $e');
    }
  }
}