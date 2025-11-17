import 'package:weatherapi_gse/domain/datasources/local_storage_datasource.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';
import 'package:weatherapi_gse/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository{

  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);


  @override
  Future<bool> isFavoriteEvent(Event event) {
    return datasource.isFavoriteEvent(event);
  }

  @override
  Future<List<Event>> loadFavoriteEvents({int limit = 10, int offset = 0}) {
    return datasource.loadFavoriteEvents(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavoriteEvent(Event event) {
    return datasource.toggleFavoriteEvent(event);
  }

}