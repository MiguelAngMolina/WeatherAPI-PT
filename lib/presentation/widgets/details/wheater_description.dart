import 'package:flutter/material.dart';

class WeatherDescriptionCard extends StatelessWidget {
    final String description;

    const WeatherDescriptionCard({
      super.key,
      required this.description,
    });

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.cloud_sync_outlined),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                description,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ) 
    );
  }
}