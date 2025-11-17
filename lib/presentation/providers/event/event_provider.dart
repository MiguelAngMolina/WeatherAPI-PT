import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/report_repository_provider.dart';

part 'event_provider.g.dart';

@Riverpod(keepAlive: true)
class EventState extends _$EventState {
  
  @override
    AsyncValue<List<Event>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> loadEvents(String location, String start, String end) async {
    state = const AsyncValue.loading();
    final repo = ref.read(reportRepositoryProvider);

    try {
      final events = await repo.getEvents(location, start, end);
      state = AsyncValue.data(events);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}