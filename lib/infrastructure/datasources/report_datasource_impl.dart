import 'package:dio/dio.dart';
import 'package:weatherapi_gse/config/constants/environment.dart';
import 'package:weatherapi_gse/domain/domain.dart';

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
      '$location/last2days',
      queryParameters: {
        "key": Environment.wheaterApiKey,
        "lang": "es",
        "unitGroup": "metric",
        "elements": "remove:stations"
      });
      
      return response.data; 
    
  }

}