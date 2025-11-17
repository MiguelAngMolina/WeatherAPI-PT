import 'package:weatherapi_gse/domain/datasources/local_storage_datasource.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';

class DriftDatasource extends LocalStorageDatasource{
  @override
  Future<void> isFavoriteEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> loadFavoriteEvents({int limit = 10, int offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavoriteEvent(Event event) {
    throw UnimplementedError();
  }

}