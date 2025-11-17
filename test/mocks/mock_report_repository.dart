import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/domain/repositories/report_repository.dart';

class MockReportRepository implements ReportRepository {
  Report? _report;
  Exception? _error;

  void mockReportToReturn(Report report) {
    _report = report;
  }

  void mockError(Exception e) {
    _error = e;
  }

  @override
  Future<Report> getReport(String location) async {
    if (_error != null) throw _error!;
    return _report!;
  }

  @override
  Future<List<Event>> getEvents(String location, String d1, String d2) {
    throw UnimplementedError();
  }
}
