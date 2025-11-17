import 'package:flutter/material.dart';


class NoDataScreen extends StatelessWidget {
  final bool? isFavsScreen;
  const NoDataScreen({super.key, this.isFavsScreen});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text(
              "Tu búsqueda no arrojó datos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            ...(isFavsScreen == true
            ? [Text(
              "No tienes nigun evento guardado en favoritos aún.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            ] : [
              Text(
              "Intenta una fecha diferente o ajusta tu búsqueda.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            ])
          ],
        ),
      ),
    );
  }
}
