import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/report/report_provider.dart';
import 'package:weatherapi_gse/presentation/widgets/widgets.dart';


class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: reportAsync.when(
            data: (report) => report == null 
            ? Text('No hay Datos')
            : WeatherBody(report: report),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade200 ,
        child: Icon(Icons.arrow_back_outlined),
        onPressed: (){
          context.pop();
          }),
    );
  }
}


class WeatherBody extends StatelessWidget {
  final Report report;

  const WeatherBody({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            LocationHeader(report: report),
            const SizedBox(height: 16),
             // Título del pronóstico
            Text(
              "Pronóstico de los últimos ${report.days.length} días",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
              const SizedBox(height: 16),

              ...report.days.reversed.toList().asMap().entries.map((entry) {
              final index = entry.key;
              final dia = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    context.push(
                      '/detalles_day/${index+1}',
                      extra: {
                        'dia': dia,
                        'location': report.location,
                      },
                    );
                  },
                  child: DailyDetails(dia: dia,),
                ),
              );
            }),
          ],
      ),
    );
  }
}











