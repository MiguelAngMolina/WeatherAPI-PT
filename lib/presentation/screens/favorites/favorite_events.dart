import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapi_gse/presentation/providers/storage/favorite_events_provider.dart';
import 'package:weatherapi_gse/presentation/screens/shared/no_data_screen.dart';
import 'package:weatherapi_gse/presentation/widgets/widgets.dart';

class FavoriteEvents extends ConsumerStatefulWidget {
  const FavoriteEvents({super.key});

  @override
  ConsumerState<FavoriteEvents> createState() => _FavoriteEventsState();
}

class _FavoriteEventsState extends ConsumerState<FavoriteEvents> {

  @override
  void initState() {
    ref.read(favoriteEventsProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteEvents = ref.watch(favoriteEventsProvider);
    final isLoading = ref.watch(favoriteEventsProvider.notifier).isLoading;

    final theme = Theme.of(context);
    
      if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if(favoriteEvents.isEmpty) return NoDataScreen(isFavsScreen: true,);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16,10),
            child: Text(
              'Eventos favoritos (Offline)',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            
            child: ListView.builder(
              itemCount: favoriteEvents.keys.length,
              itemBuilder: (context, index) {
                final event = favoriteEvents.values.toList()[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    context.push(
                      '/detalles_event/${index + 1}',
                      extra: { 'event': event },
                    );
                  },
                  child: EventDetails(
                    event: event,
                    showLocation: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        backgroundColor: Colors.green.shade200 ,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
