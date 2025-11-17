import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/report_repository_provider.dart';

part 'report_provider.g.dart';

@Riverpod(keepAlive: true)
class ReportState extends _$ReportState {
  
  @override
    AsyncValue<Report?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> newReport(String location) async {
    state = const AsyncValue.loading();
    final reportRepo = ref.read(reportRepositoryProvider);

    try{
    final report = await reportRepo.getReport(location);
        print('Busqueda de la $location');
     state = AsyncValue.data(report);

    } catch(e, st){
      state = AsyncValue.error(e, st);
    }

  }
}