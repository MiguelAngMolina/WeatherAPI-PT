import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/providers/event/event_provider.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

Future<void> selectDateRange(BuildContext context, WidgetRef ref, String location ) async {
  final DateTime now = DateTime.now();

  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(now.year - 5),
    lastDate: now,
    initialEntryMode: DatePickerEntryMode.input,
    locale: const Locale('es', 'ES'),
  );

  if (picked == null) return;

  final start = picked.start;
  final end = picked.end;

  final startStr = "${start.year}-${start.month}-${start.day}";
  final endStr = "${end.year}-${end.month}-${end.day}";

  ref.read(eventStateProvider.notifier).loadEvents(location, startStr, endStr);
}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(eventStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Prueba del provider')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: reportAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text("Error: $e"),
                data: (event) => SingleChildScrollView(
                  child: Text(
                    event.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => selectDateRange(context, ref, "38.96%2C-96.02"),
              child: const Text("Seleccionar rango y cargar eventos"),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.push('/event'),
              child: const Text('Ir a event'),
            ),
          ],
        ),
      ),
    );
  }
}
