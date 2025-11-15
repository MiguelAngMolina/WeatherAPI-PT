import 'package:weatherapi_gse/domain/entities/entities.dart';

abstract class ReportDatasource {
  Future<Report> getReport(String location);
}