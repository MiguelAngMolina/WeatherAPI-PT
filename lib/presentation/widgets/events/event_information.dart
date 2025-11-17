import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/config/helpers/event_translation_helper.dart';
import 'package:weatherapi_gse/config/helpers/icons_helper.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';
import 'package:weatherapi_gse/presentation/providers/storage/favorite_events_provider.dart';
import 'package:weatherapi_gse/presentation/providers/storage/is_favorite_event_provider.dart';

class EventInformation extends ConsumerWidget {
  final Event event;

  const EventInformation({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = WeatherIconsMapper.getIconEvent(event.type);
    final isFavoriteFuture = ref.watch(isFavoriteEventProvider(event));


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tipo de evento: ${EventLabels.label(event.type)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            
            IconButton(
              onPressed: ()  async { 
                await ref.read(favoriteEventsProvider.notifier)
                .toggleFavoriteEvent(event);

                  ref.invalidate(isFavoriteEventProvider(event));
                
              },
              icon: isFavoriteFuture.when(
                data: (isFavorite)=> isFavorite 
                ? Icon( Icons.favorite, color: Colors.redAccent, size: 28)
                : Icon( Icons.favorite_border, color: Colors.redAccent, size: 28),
                error: (_, _) => throw Exception('Error al cargar los favoritos'), 
                loading: () => CircularProgressIndicator(),
                )
              
            ),
          ],
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


