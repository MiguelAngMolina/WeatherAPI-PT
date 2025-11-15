import 'package:weatherapi_gse/domain/entities/entities.dart';

abstract class ReportRepository {
  Future<Report> getReport(String location);
}