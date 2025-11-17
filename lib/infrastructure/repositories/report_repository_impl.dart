import 'package:weatherapi_gse/domain/domain.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';



class ReportRepositoryImpl extends ReportRepository{

  final ReportDatasource datasource;
  ReportRepositoryImpl(this.datasource);

  @override
  Future<Report> getReport(String location) async {
    return datasource.getReport(location);
  }
  
  @override
  Future<List<Event>> getEvents(String location, String date1, String date2) {
    return datasource.getEvents(location, date1, date2);
  }

}