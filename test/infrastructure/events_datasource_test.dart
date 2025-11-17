import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';

import 'package:weatherapi_gse/infrastructure/datasources/report_datasource_impl.dart';
import 'package:weatherapi_gse/config/constants/environment.dart';

class _FakeEnv {
  static String key = "FAKE_KEY_TEST";
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late ReportDatasourceImpl datasource;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl:
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/',
    ));

    adapter = DioAdapter(dio: dio);
    datasource = ReportDatasourceImpl(dio: dio);

    Environment.wheaterApiKey = _FakeEnv.key;
  });

  test("getEvents devuelve lista correcta", () async {
    adapter.onGet(
      'Madrid/2025-01-01/2025-01-05',
      (server) => server.reply(200, {
        "latitude": 40.0,
        "longitude": -3.0,
        "resolvedAddress": "Madrid",
        "address": "Madrid",
        "timezone": "Europe/Madrid",
        "tzoffset": 1,
        "days": [
          {
            "datetime": "2025-01-01",
            "events": [
              {
                "datetime": "2025-01-01T10:00:00Z",
                "datetimeEpoch": 1735725600,
                "type": "rain",
                "latitude": 40.1,
                "longitude": -3.2,
                "distance": 12.5,
                "desc": "Lluvia moderada",
                "size": 0.0
              }
            ]
          }
        ]
      }),
      queryParameters: {
        "key": "FAKE_KEY_TEST",
        "lang": "es",
        "include": "events",
        "unitGroup": "metric",
        "elements": "remove:stations",
      },
    );


    final result = await datasource.getEvents(
      "Madrid",
      "2025-01-01",
      "2025-01-05",
    );

    expect(result, isA<List<Event>>());
    expect(result.length, 1);
    expect(result.first.type, "rain");
  });

  test("getEvents lanza error", () async {
    adapter.onGet(
      'Madrid/2025-01-01/2025-01-05',
      (server) => server.reply(500, {}),
    );

    expect(
      () => datasource.getEvents("Madrid", "2025-01-01", "2025-01-05"),
      throwsException,
    );
  });
}
