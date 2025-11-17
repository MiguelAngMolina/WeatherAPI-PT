import 'package:weatherapi_gse/domain/entities/entities.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavoriteEvent(Event event);
  Future<void> isFavoriteEvent(Event event);
  Future<List<Event>> loadFavoriteEvents({
    int limit = 10,
    int offset = 0
  });
}
