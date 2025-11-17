import 'package:drift/drift.dart' as drift;
import 'package:weatherapi_gse/config/database/database.dart';
import 'package:weatherapi_gse/domain/datasources/local_storage_datasource.dart';
import 'package:weatherapi_gse/domain/entities/events.dart';

class DriftDatasource extends LocalStorageDatasource{

  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
  : database =  databaseToUse ?? db;

  @override
  Future<bool> isFavoriteEvent(Event event) async {
    final query = database.select(database.favoriteEvents)
    ..where((table) => table.location.equals(event.location) &
                       table.datetime.equals(event.datetime) &
                       table.type.equals(event.type));

    final favoriteEvent = await query.getSingleOrNull();
    return favoriteEvent != null;
  }

  @override
  Future<List<Event>> loadFavoriteEvents({int limit = 10, int offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavoriteEvent(Event event) async {
    
    final isFavorite = await isFavoriteEvent(event);

    if (isFavorite){
      final deleteQuery = database.delete(database.favoriteEvents)
        ..where((table) => table.location.equals(event.location) &
                       table.datetime.equals(event.datetime) &
                       table.type.equals(event.type));

      await deleteQuery.go();
      return;
    }
    await database.into(database.favoriteEvents)
    .insert(
      FavoriteEventsCompanion.insert(
        location: event.location, 
        datetime: event.datetime, 
        type: event.type, 
        desc: event.desc,
        distance: drift.Value(event.distance),
        latitude:  drift.Value(event.latitude),
        longitude: drift.Value(event.longitude),
        reportlat: drift.Value(event.reportlat),
        reportlong:drift.Value( event.reportlong),
        )
    );
  }

}