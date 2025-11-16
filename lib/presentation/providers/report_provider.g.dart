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
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportStateHash();

  @$internal
  @override
  ReportState create() => ReportState();
}

String _$reportStateHash() => r'22855e34563b139f88e3368f4c695273e8b7bd80';

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
