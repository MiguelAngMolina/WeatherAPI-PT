
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/domain/entities/entities.dart';
import 'package:weatherapi_gse/presentation/providers/storage/local_storage_provider.dart';

final isFavoriteEventProvider = FutureProvider.family<bool,Event>((ref, event){

  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isFavoriteEvent(event);
});