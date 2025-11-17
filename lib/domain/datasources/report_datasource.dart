import 'package:weatherapi_gse/domain/entities/entities.dart';

abstract class ReportDatasource {
  Future<Report> getReport(String location);
  Future<List<Event>> getEvents(String location, DateTime date1, DateTime date2);
}