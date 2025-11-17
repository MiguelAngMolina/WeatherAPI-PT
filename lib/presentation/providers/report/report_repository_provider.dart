

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/domain/repositories/report_repository.dart';
import 'package:weatherapi_gse/infrastructure/datasources/report_datasource_impl.dart';
import 'package:weatherapi_gse/infrastructure/repositories/report_repository_impl.dart';


final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepositoryImpl(ReportDatasourceImpl());
});
