import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/providers/event/event_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

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
              onPressed: () {
                ref.read(eventStateProvider.notifier).loadEvents('38.96%2C-96.02', '2020-7-10', '2020-7-12');
              },
              child: const Text('Solicitar nuevo reporte'),
            ),

            ElevatedButton(
              onPressed: () {
                context.push('/event');
              },
              child: const Text('Nueva'),
            ),
          ],
        ),
      ),
    );
  }
}