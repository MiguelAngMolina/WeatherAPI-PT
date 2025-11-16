import 'package:flutter/material.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
class WeatherDetailsCard extends StatelessWidget {
  final Day dia;

  const WeatherDetailsCard({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Text(
            'Detalles',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherDetailItem(
                icon: Icons.thermostat,
                label: "Sensación \n Térmica",
                value: "${dia.feelslikeavg}°",
              ),
              WeatherDetailItem(
                icon: Icons.water_drop,
                label: "Probabilidad \n      lluvia",
                value: "${dia.precipprob}%",
              ),
              WeatherDetailItem(
                icon: Icons.wb_sunny,
                label: "Índice UV",
                value: "${dia.uvindex}%",
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherDetailItem(
                icon: Icons.air,
                label: "Vel. Viento",
                value: "${dia.windspeed} m/s",
              ),
              WeatherDetailItem(
                icon: Icons.cloud,
                label: "% Nubosidad",
                value: "${dia.cloudcover}%",
              ),
              WeatherDetailItem(
                icon: Icons.grain,
                label: "Humedad",
                value: "${dia.humidity}%",
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherDetailItem(
                icon: Icons.visibility,
                label: "Visibilidad",
                value: "${dia.visibility} m",
              ),
              WeatherDetailItem(
                icon: Icons.speed,
                label: "Presion atmosférica",
                value: "${dia.pressure} hPa",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: theme.colorScheme.primary, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
