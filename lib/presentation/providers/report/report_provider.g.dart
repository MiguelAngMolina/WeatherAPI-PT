// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportState)
const reportStateProvider = ReportStateProvider._();

final class ReportStateProvider
    extends $NotifierProvider<ReportState, AsyncValue<Report?>> {
  const ReportStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportStateHash();

  @$internal
  @override
  ReportState create() => ReportState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Report?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Report?>>(value),
    );
  }
}

String _$reportStateHash() => r'f7f9304b3bbae01fd0003679034966b03e5a05b4';

abstract class _$ReportState extends $Notifier<AsyncValue<Report?>> {
  AsyncValue<Report?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Report?>, AsyncValue<Report?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Report?>, AsyncValue<Report?>>,
              AsyncValue<Report?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
