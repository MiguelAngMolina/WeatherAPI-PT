import 'package:flutter/material.dart';
import 'package:weatherapi_gse/config/helpers/dateformart.dart';
import 'package:weatherapi_gse/config/helpers/event_translation_helper.dart';
import 'package:weatherapi_gse/config/helpers/icons_helper.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';

class DailyDetails extends StatelessWidget {
  final Day dia;

  const DailyDetails({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HumanFormats.shortDate(dia.datetime),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        InfoChip(
                          text: "🌡️ ${dia.tempavg.toStringAsFixed(1)}°C",
                          bgColor: Colors.orange.withValues(alpha: 0.3),
                          textColor: Colors.orange.shade800,
                        ),
                        const SizedBox(width: 12),
                        InfoChip(
                          text: "🌧️ ${dia.precipprob.toStringAsFixed(0)}%",
                          bgColor: Colors.blue.withValues(alpha: 0.3),
                          textColor: Colors.blue.shade800,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      capitalize(dia.conditions),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Icon(
                WeatherIconsMapper.getIconWeather(dia.icon),
                size: 48,
                color: Colors.green.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  final Event event;
  final bool? showLocation; 

  const EventDetails({super.key, required this.event, this.showLocation = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    ...(showLocation == true
                    ? [
                      Text(
                      event.location,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    ] : [SizedBox.shrink()]),
                    Text(
                      HumanFormats.shortDateTime(event.datetime),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        InfoChip(
                          text: EventLabels.label(event.type),
                          bgColor: EventColors.bg(event.type),
                          textColor: EventColors.text(event.type),
                        ),
                        const SizedBox(width: 12),
                        InfoChip(
                          text: "A ${event.distance} Km",
                          bgColor: Colors.blue.withValues(alpha: 0.2),
                          textColor: Colors.blue.shade800,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      capitalize(event.desc),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Icon(
                WeatherIconsMapper.getIconEvent(event.type),
                size: 48,
                color: Colors.green.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;

  const InfoChip({
    super.key,
    required this.text,
    this.bgColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1)
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.black87,
        ),
      ),
    );
  }
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

class EventColors {
  static Color bg(String type) {
    switch (type.toLowerCase()) {
      case 'hail':
        return Colors.blue.withValues(alpha: 0.25);
      case 'tornado':
        return Colors.red.withValues(alpha: 0.25);
      case 'wind':
        return Colors.green.withValues(alpha: 0.25);
      case 'earthquake':
        return Colors.orange.withValues(alpha: 0.25);
      default:
        return Colors.grey.withValues(alpha: 0.2);
    }
  }

  static Color text(String type) {
    switch (type.toLowerCase()) {
      case 'hail':
        return Colors.blue.shade800;
      case 'tornado':
        return Colors.red.shade800;
      case 'wind':
        return Colors.green.shade900;
      case 'earthquake':
        return Colors.orange.shade900;
      default:
        return Colors.grey.shade800;
    }
  }
}

