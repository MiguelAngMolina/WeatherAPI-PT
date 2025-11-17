import 'package:flutter/material.dart';
import 'package:weatherapi_gse/config/helpers/dateformart.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';

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


class LocationAndDate extends StatelessWidget {
  final String location;
  final DateTime? date;

  const LocationAndDate({
    super.key,
    required this.location,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: theme.colorScheme.onSurface,
          ),
        ),

        ...(date != null
        ? [
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_month,
                  size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 6),
              Text(
                HumanFormats.autoFormat(date!),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ]
        : [SizedBox.shrink()])
      ],
    );
  }
}