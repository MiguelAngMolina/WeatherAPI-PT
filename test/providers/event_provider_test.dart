import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/event/event_provider.dart';
import 'package:weatherapi_gse/presentation/providers/report/report_repository_provider.dart';

import 'package:mockito/mockito.dart';
import '../mocks/mocks_test.mocks.dart';

void main() {
  late MockReportRepository mockRepo;

  setUp(() {
    mockRepo = MockReportRepository();
  });

  ProviderContainer makeContainer() {
    return ProviderContainer(
      overrides: [reportRepositoryProvider.overrideWithValue(mockRepo)],
    );
  }

  test("loadEvents: loading → data", () async {
    final container = makeContainer();

    when(mockRepo.getEvents(any, any, any)).thenAnswer(
      (_) async => [
        Event(
          location: "Madrid",
          datetime: DateTime.now(),
          type: "rain",
          latitude: 0,
          reportlat: 0,
          longitude: 0,
          reportlong: 0,
          distance: 0,
          desc: "Lluvia",
        ),
      ],
    );

    final controller = container.read(eventStateProvider.notifier);

    expect(
      container.read(eventStateProvider),
      isA<AsyncData<List<Event>>>().having((d) => d.value, 'value', []),
    );

    final future = controller.loadEvents("Madrid", "2025-01-01", "2025-01-05");

    expect(container.read(eventStateProvider), isA<AsyncLoading>());

    await future;

    final state = container.read(eventStateProvider);

    expect(state, isA<AsyncData>());
    expect(state.value!.length, 1);
    expect(state.value!.first.type, "rain");
  });
}
