import 'package:flutter/material.dart';
import 'package:weatherapi_gse/config/helpers/event_translation_helper.dart';
import 'package:weatherapi_gse/config/helpers/icons_helper.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';

class EventInformation extends StatelessWidget {
  final Event event;

  const EventInformation({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final icon = WeatherIconsMapper.getIconEvent(event.type);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tipo de evento: ${EventLabels.label(event.type)}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 120,
            color: Colors.green.shade900,
          ),
        ),
      ],
    );
  }
}


