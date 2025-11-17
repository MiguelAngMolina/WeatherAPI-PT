import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/report/report_provider.dart';
import 'package:weatherapi_gse/presentation/providers/report/report_repository_provider.dart';

import '../mocks/mock_report_repository.dart';

void main() {
  test('ReportState inicializa con AsyncData(null)', () {
    final container = ProviderContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(MockReportRepository()),
      ],
    );

    final state = container.read(reportStateProvider);

    expect(state, const AsyncData<Report?>(null));
  });

  test('newReport: loading → data', () async {
    final mockRepo = MockReportRepository();
    final fakeReport = Report(
      location: "Madrid",
      latitude: 10,
      longitude: 20,
      days: [],
    );

    mockRepo.mockReportToReturn(fakeReport);

    final container = ProviderContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );

    final notifier = container.read(reportStateProvider.notifier);

    final future = notifier.newReport("Madrid");

    expect(container.read(reportStateProvider),isA<AsyncLoading>(),);


    await future;

    final state = container.read(reportStateProvider);
    expect(state.value, fakeReport);
  });

  test('newReport captura errores y setea AsyncError', () async {
    final mockRepo = MockReportRepository();
    mockRepo.mockError(Exception("API falló"));

    final container = ProviderContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );

    final notifier = container.read(reportStateProvider.notifier);

    await notifier.newReport("Madrid");

    final state = container.read(reportStateProvider);

    expect(state.hasError, true);
  });
}
