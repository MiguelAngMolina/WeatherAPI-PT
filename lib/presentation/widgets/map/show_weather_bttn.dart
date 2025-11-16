
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/providers/report_provider.dart';

class ShowWeatherReportButton extends StatelessWidget {
  const ShowWeatherReportButton({
    super.key,
    required this.showWeatherButton,
    required this.searchController,
    required this.ref,
  });

  final bool showWeatherButton;
  final TextEditingController searchController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 40,
      right: 40,
      child: AnimatedOpacity(
        opacity: showWeatherButton ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: ElevatedButton(
          onPressed: () {
              final locationName = searchController.text.trim();
              if (locationName.isEmpty) return;
              ref.read(reportStateProvider.notifier).newReport(locationName);
              context.push('/report'); 
            },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade200,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Ver reporte del clima",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}