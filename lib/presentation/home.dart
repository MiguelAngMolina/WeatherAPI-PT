import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/presentation/providers/report_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportStateProvider);

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
                data: (report) => SingleChildScrollView(
                  child: Text(
                    report.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                ref.read(reportStateProvider.notifier).newReport("London");
              },
              child: const Text('Solicitar nuevo reporte'),
            ),
          ],
        ),
      ),
    );
  }
}
