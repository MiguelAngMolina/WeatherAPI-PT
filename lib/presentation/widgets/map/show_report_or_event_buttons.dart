import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/providers/event/event_provider.dart';
import 'package:weatherapi_gse/presentation/providers/report/report_provider.dart';

/// ------------------------------------------------
/// Botón: Ver reporte del clima
/// ------------------------------------------------
class WeatherReportButton extends StatelessWidget {
  const WeatherReportButton({
    super.key,
    required this.locationName,
    required this.ref,
  });

  final String locationName;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return _OptionButton(
      label: "Ver reporte del clima",
      icon: Icons.cloud,
      onTap: () {
        if (locationName.isEmpty) return;
        ref.read(reportStateProvider.notifier).newReport(locationName);
        context.push('/report');
      },
    );
  }
}

/// ------------------------------------------------
/// Botón: Ver eventos (con datepicker)
/// ------------------------------------------------
class WeatherEventsButton extends StatelessWidget {
  const WeatherEventsButton({
    super.key,
    required this.locationName,
    required this.ref,
  });

  final String locationName;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return _OptionButton(
      label: "Ver eventos",
      icon: Icons.bolt,
      onTap: () async {
        if (locationName.isEmpty) return;

        final picked = await selectDateRange(context, ref, locationName);

        if (picked != null) {
          context.push('/event');
        }
      },
    );
  }
}

/// ------------------------------------------------
/// Botón base reutilizable para ambos
/// ------------------------------------------------
class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.green.shade900,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 1,
      ),
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// ------------------------------------------------
/// Date range picker (solo pasado)
/// ------------------------------------------------
Future<DateTimeRange?> selectDateRange(
  BuildContext context,
  WidgetRef ref,
  String location,
) async {
  final now = DateTime.now();

  final picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(now.year - 5),
    lastDate: now,
    initialEntryMode: DatePickerEntryMode.input,
    locale: const Locale('es', 'ES'),
  );

  if (picked == null) return null;

  final start = picked.start;
  final end = picked.end;

  final startStr = "${start.year}-${start.month}-${start.day}";
  final endStr = "${end.year}-${end.month}-${end.day}";

  await ref
      .read(eventStateProvider.notifier)
      .loadEvents(location, startStr, endStr);

  return picked;
}
