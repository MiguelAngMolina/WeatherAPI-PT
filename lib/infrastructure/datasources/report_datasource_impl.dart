import 'package:dio/dio.dart';
import 'package:weatherapi_gse/config/constants/environment.dart';
import 'package:weatherapi_gse/domain/domain.dart';
import 'package:weatherapi_gse/infrastructure/mappers/report_mapper.dart';
import 'package:weatherapi_gse/infrastructure/models/reports_response.dart';

import 'dart:convert';
class ReportDatasourceImpl extends ReportDatasource{
  
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/',
      queryParameters: {

      }
    )
  );
  
  @override
  Future<Report> getReport(String location) async {

    final response = await dio.get(
      '$location/2025-11-12',
      queryParameters: {
        "key": Environment.wheaterApiKey,
        "lang": "es",
        "unitGroup": "metric",
        "elements": "remove:stations"
      });


      // print(const JsonEncoder.withIndent('  ').convert(response.data));

      final reportResponse = ReportResponse.fromJson(response.data);
      // print("===== REPORT RESPONSE =====");
      // print(reportResponse.toJson());
      final Report report = ReportMapper.reportResponsetoEntity(reportResponse);

      return report;
    
  }

}