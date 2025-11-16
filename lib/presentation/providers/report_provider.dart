import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/report_repository_provider.dart';

part 'report_provider.g.dart';

@Riverpod(keepAlive: true)
class ReportState extends _$ReportState {
  
  @override
  Future<Report> build() async {
    final repo = ref.read(reportRepositoryProvider);
    return await repo.getReport("Bucaramanga, Colombia");
  }

  Future<void> newReport(String location) async {
    state = const AsyncValue.loading();
    final reportRepo = ref.read(reportRepositoryProvider);
    final report = await reportRepo.getReport(location);
     state = AsyncValue.data(report);
  }
}