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
    extends $AsyncNotifierProvider<ReportState, Report> {
  const ReportStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportStateHash();

  @$internal
  @override
  ReportState create() => ReportState();
}

String _$reportStateHash() => r'cb2bdcfa88a411ba4e49e55e6b9824d9ad8f8dec';

abstract class _$ReportState extends $AsyncNotifier<Report> {
  FutureOr<Report> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Report>, Report>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Report>, Report>,
              AsyncValue<Report>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
