import 'package:weatherapi_gse/domain/domain.dart';



class ReportRepositoryImpl extends ReportRepository{

  final ReportDatasource datasource;
  ReportRepositoryImpl({required this.datasource});

  @override
  Future<Report> getReport(String location) async {
    return datasource.getReport(location);
  }

}