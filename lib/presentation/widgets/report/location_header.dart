import 'package:flutter/material.dart';
import 'package:weatherapi_gse/domain/domain.dart';

class LocationHeader extends StatelessWidget {
  final Report report;
  const LocationHeader({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Nombre de la ubicación
          Text(
            report.location!,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 6),

          // Latitud y Longitud
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.place_outlined, size: 16, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                'Lat: ${report.latitude.toStringAsFixed(4)}',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.place, size: 16, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                'Lon: ${report.longitude.toStringAsFixed(4)}',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
