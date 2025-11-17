import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// class TodoItems extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text().withLength(min: 6, max: 32)();
//   TextColumn get content => text().named('body')();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }

class FavoriteEvents extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get location => text().named('event_location')();
  DateTimeColumn get datetime => dateTime().named('event_datetime')();
  TextColumn get type => text().named('event_type')();
  RealColumn get latitude => real().named('event_latitude').withDefault(const Constant(0.0))();
  RealColumn get reportlat => real().named('report_latitude').withDefault(const Constant(0.0))();
  RealColumn get longitude => real().named('event_longitude').withDefault(const Constant(0.0))();
  RealColumn get reportlong => real().named('report_longitude').withDefault(const Constant(0.0))();
  RealColumn get distance => real().named('event_distance').withDefault(const Constant(0.0))();
  TextColumn get desc => text().named('event_descripcion')();

}


@DriftDatabase(tables: [FavoriteEvents])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}


final db = AppDatabase();