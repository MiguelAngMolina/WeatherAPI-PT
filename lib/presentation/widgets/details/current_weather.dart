import 'package:flutter/material.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';

class CurrentWeather extends StatelessWidget {
  final Day dia;

  const CurrentWeather({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          Text(
            "${dia.tempavg}°C",
            style: const TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Temperatura promedio",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _TempItem(
                value: dia.tempmax,
                label: "Temperatura Máxima",
              ),
              _TempItem(
                value: dia.tempmin,
                label: "Temperatura Mínima",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TempItem extends StatelessWidget {
  final double value;
  final String label;

  const _TempItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          "$value°C",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
