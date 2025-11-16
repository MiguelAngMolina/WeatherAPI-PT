import 'package:flutter/material.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';

class SunTimesCard extends StatelessWidget {
  final Day dia;
  const SunTimesCard({super.key, required this.dia});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),

      child: Column(
        children: [
          SunCard(
            title: "AMANECER", 
            time: dia.sunrise, 
            icon: Icons.wb_sunny
            ),
          const SizedBox(height: 16),
          SunCard(
            title: "ATARDECER",
            time: dia.sunset,
            icon: Icons.nights_stay,
          ),
        ],
      ),
    );
  }
}


class SunCard extends StatelessWidget {
  final String title; 
  final String time; 
  final IconData icon; 

  const SunCard({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Icon(icon, size: 58, color: theme.colorScheme.primary),
            ],
          ),
        ),
      ),
    );
  }
}