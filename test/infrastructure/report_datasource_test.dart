import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherapi_gse/config/constants/environment.dart';
import 'package:weatherapi_gse/infrastructure/datasources/report_datasource_impl.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/config/helpers/error_handling.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';


void main() {
  late ReportDatasourceImpl datasource;
  late Dio dio;
  late DioAdapter mock;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/',
    ));
    mock = DioAdapter(dio: dio);
    datasource = ReportDatasourceImpl()..dio.httpClientAdapter = mock;
  });

  test('getReport devuelve un Report correctamente', () async {
    mock.onGet(
      'Madrid/last2days',
      (server) => server.reply(200, {
        "latitude": 10,
        "longitude": 20,
        "resolvedAddress": "Madrid",
        "days": [
          {"datetime": "2025-01-01", "temp": 22, "events": []}
        ]
      }),
      queryParameters: {
        "key": Environment.wheaterApiKey,
        "include": "days",
        "lang": "es",
        "unitGroup": "metric",
        "elements": "remove:stations",
      },
    );

    final result = await datasource.getReport("Madrid");

    expect(result, isA<Report>());
    expect(result.location, "Madrid");
    expect(result.days.length, 1);
  });

  test('getReport lanza ApiException en error', () async {
    mock.onGet(
      'Madrid/last2days',
      (server) => server.reply(500, {}),
    );

    expect(() => datasource.getReport("Madrid"), throwsA(isA<ApiException>()));
  });
}
