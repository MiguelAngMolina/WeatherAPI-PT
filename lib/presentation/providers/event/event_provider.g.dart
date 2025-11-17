// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EventState)
const eventStateProvider = EventStateProvider._();

final class EventStateProvider
    extends $NotifierProvider<EventState, AsyncValue<List<Event>>> {
  const EventStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventStateHash();

  @$internal
  @override
  EventState create() => EventState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Event>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Event>>>(value),
    );
  }
}

String _$eventStateHash() => r'c7fb0702d797b791dbc729d1ff1448c16fd1a130';

abstract class _$EventState extends $Notifier<AsyncValue<List<Event>>> {
  AsyncValue<List<Event>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Event>>, AsyncValue<List<Event>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Event>>, AsyncValue<List<Event>>>,
              AsyncValue<List<Event>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
