import 'package:weatherapi_gse/domain/entities/entities.dart';

abstract class ReportRepository {
  Future<Report> getReport(String location);
  Future<List<Event>> getEvents(String location, String date1, String date2);
}