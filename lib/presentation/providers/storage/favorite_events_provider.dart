


import 'package:flutter_riverpod/legacy.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/domain/repositories/local_storage_repository.dart';
import 'package:weatherapi_gse/presentation/providers/storage/local_storage_provider.dart';

final favoriteEventsProvider = StateNotifierProvider((ref){

  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);

});


 class StorageMoviesNotifier extends StateNotifier<Map<String, Event>>{
  int page = 0;
  final  LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}):super({});


  Future<void> toggleFavoriteEvent(Event event) async {

    final isFavorite = await localStorageRepository.isFavoriteEvent(event);
    await localStorageRepository.toggleFavoriteEvent(event);

    final key = "${event.location}-${event.datetime}-${event.type}";

    if (isFavorite){
      state.remove(key);
      state = {...state};
      return;
    }

    state = {...state, key: event};
  }
  
 }