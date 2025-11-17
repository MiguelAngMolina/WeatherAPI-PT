import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/presentation/providers/storage/favorite_events_provider.dart';

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

    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteEvents.keys.length,
        itemBuilder: (context, index) {
          final event = favoriteEvents.values.toList()[index];
          return ListTile(
            title: Text(event.desc),
          );
        },
        ),
    );
  }
}