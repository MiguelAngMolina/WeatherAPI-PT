// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteEventsTable extends FavoriteEvents
    with TableInfo<$FavoriteEventsTable, FavoriteEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'event_location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _datetimeMeta = const VerificationMeta(
    'datetime',
  );
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
    'event_datetime',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'event_latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _reportlatMeta = const VerificationMeta(
    'reportlat',
  );
  @override
  late final GeneratedColumn<double> reportlat = GeneratedColumn<double>(
    'report_latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'event_longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _reportlongMeta = const VerificationMeta(
    'reportlong',
  );
  @override
  late final GeneratedColumn<double> reportlong = GeneratedColumn<double>(
    'report_longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'event_distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'event_descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    location,
    datetime,
    type,
    latitude,
    reportlat,
    longitude,
    reportlong,
    distance,
    desc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['event_location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('event_datetime')) {
      context.handle(
        _datetimeMeta,
        datetime.isAcceptableOrUnknown(data['event_datetime']!, _datetimeMeta),
      );
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['event_type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('event_latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['event_latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('report_latitude')) {
      context.handle(
        _reportlatMeta,
        reportlat.isAcceptableOrUnknown(
          data['report_latitude']!,
          _reportlatMeta,
        ),
      );
    }
    if (data.containsKey('event_longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(
          data['event_longitude']!,
          _longitudeMeta,
        ),
      );
    }
    if (data.containsKey('report_longitude')) {
      context.handle(
        _reportlongMeta,
        reportlong.isAcceptableOrUnknown(
          data['report_longitude']!,
          _reportlongMeta,
        ),
      );
    }
    if (data.containsKey('event_distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['event_distance']!, _distanceMeta),
      );
    }
    if (data.containsKey('event_descripcion')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['event_descripcion']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_location'],
      )!,
      datetime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}event_datetime'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}event_latitude'],
      )!,
      reportlat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}report_latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}event_longitude'],
      )!,
      reportlong: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}report_longitude'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}event_distance'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_descripcion'],
      )!,
    );
  }

  @override
  $FavoriteEventsTable createAlias(String alias) {
    return $FavoriteEventsTable(attachedDatabase, alias);
  }
}

class FavoriteEvent extends DataClass implements Insertable<FavoriteEvent> {
  final int id;
  final String location;
  final DateTime datetime;
  final String type;
  final double latitude;
  final double reportlat;
  final double longitude;
  final double reportlong;
  final double distance;
  final String desc;
  const FavoriteEvent({
    required this.id,
    required this.location,
    required this.datetime,
    required this.type,
    required this.latitude,
    required this.reportlat,
    required this.longitude,
    required this.reportlong,
    required this.distance,
    required this.desc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_location'] = Variable<String>(location);
    map['event_datetime'] = Variable<DateTime>(datetime);
    map['event_type'] = Variable<String>(type);
    map['event_latitude'] = Variable<double>(latitude);
    map['report_latitude'] = Variable<double>(reportlat);
    map['event_longitude'] = Variable<double>(longitude);
    map['report_longitude'] = Variable<double>(reportlong);
    map['event_distance'] = Variable<double>(distance);
    map['event_descripcion'] = Variable<String>(desc);
    return map;
  }

  FavoriteEventsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteEventsCompanion(
      id: Value(id),
      location: Value(location),
      datetime: Value(datetime),
      type: Value(type),
      latitude: Value(latitude),
      reportlat: Value(reportlat),
      longitude: Value(longitude),
      reportlong: Value(reportlong),
      distance: Value(distance),
      desc: Value(desc),
    );
  }

  factory FavoriteEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteEvent(
      id: serializer.fromJson<int>(json['id']),
      location: serializer.fromJson<String>(json['location']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      type: serializer.fromJson<String>(json['type']),
      latitude: serializer.fromJson<double>(json['latitude']),
      reportlat: serializer.fromJson<double>(json['reportlat']),
      longitude: serializer.fromJson<double>(json['longitude']),
      reportlong: serializer.fromJson<double>(json['reportlong']),
      distance: serializer.fromJson<double>(json['distance']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<String>(location),
      'datetime': serializer.toJson<DateTime>(datetime),
      'type': serializer.toJson<String>(type),
      'latitude': serializer.toJson<double>(latitude),
      'reportlat': serializer.toJson<double>(reportlat),
      'longitude': serializer.toJson<double>(longitude),
      'reportlong': serializer.toJson<double>(reportlong),
      'distance': serializer.toJson<double>(distance),
      'desc': serializer.toJson<String>(desc),
    };
  }

  FavoriteEvent copyWith({
    int? id,
    String? location,
    DateTime? datetime,
    String? type,
    double? latitude,
    double? reportlat,
    double? longitude,
    double? reportlong,
    double? distance,
    String? desc,
  }) => FavoriteEvent(
    id: id ?? this.id,
    location: location ?? this.location,
    datetime: datetime ?? this.datetime,
    type: type ?? this.type,
    latitude: latitude ?? this.latitude,
    reportlat: reportlat ?? this.reportlat,
    longitude: longitude ?? this.longitude,
    reportlong: reportlong ?? this.reportlong,
    distance: distance ?? this.distance,
    desc: desc ?? this.desc,
  );
  FavoriteEvent copyWithCompanion(FavoriteEventsCompanion data) {
    return FavoriteEvent(
      id: data.id.present ? data.id.value : this.id,
      location: data.location.present ? data.location.value : this.location,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
      type: data.type.present ? data.type.value : this.type,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      reportlat: data.reportlat.present ? data.reportlat.value : this.reportlat,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      reportlong: data.reportlong.present
          ? data.reportlong.value
          : this.reportlong,
      distance: data.distance.present ? data.distance.value : this.distance,
      desc: data.desc.present ? data.desc.value : this.desc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteEvent(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('datetime: $datetime, ')
          ..write('type: $type, ')
          ..write('latitude: $latitude, ')
          ..write('reportlat: $reportlat, ')
          ..write('longitude: $longitude, ')
          ..write('reportlong: $reportlong, ')
          ..write('distance: $distance, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    location,
    datetime,
    type,
    latitude,
    reportlat,
    longitude,
    reportlong,
    distance,
    desc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteEvent &&
          other.id == this.id &&
          other.location == this.location &&
          other.datetime == this.datetime &&
          other.type == this.type &&
          other.latitude == this.latitude &&
          other.reportlat == this.reportlat &&
          other.longitude == this.longitude &&
          other.reportlong == this.reportlong &&
          other.distance == this.distance &&
          other.desc == this.desc);
}

class FavoriteEventsCompanion extends UpdateCompanion<FavoriteEvent> {
  final Value<int> id;
  final Value<String> location;
  final Value<DateTime> datetime;
  final Value<String> type;
  final Value<double> latitude;
  final Value<double> reportlat;
  final Value<double> longitude;
  final Value<double> reportlong;
  final Value<double> distance;
  final Value<String> desc;
  const FavoriteEventsCompanion({
    this.id = const Value.absent(),
    this.location = const Value.absent(),
    this.datetime = const Value.absent(),
    this.type = const Value.absent(),
    this.latitude = const Value.absent(),
    this.reportlat = const Value.absent(),
    this.longitude = const Value.absent(),
    this.reportlong = const Value.absent(),
    this.distance = const Value.absent(),
    this.desc = const Value.absent(),
  });
  FavoriteEventsCompanion.insert({
    this.id = const Value.absent(),
    required String location,
    required DateTime datetime,
    required String type,
    this.latitude = const Value.absent(),
    this.reportlat = const Value.absent(),
    this.longitude = const Value.absent(),
    this.reportlong = const Value.absent(),
    this.distance = const Value.absent(),
    required String desc,
  }) : location = Value(location),
       datetime = Value(datetime),
       type = Value(type),
       desc = Value(desc);
  static Insertable<FavoriteEvent> custom({
    Expression<int>? id,
    Expression<String>? location,
    Expression<DateTime>? datetime,
    Expression<String>? type,
    Expression<double>? latitude,
    Expression<double>? reportlat,
    Expression<double>? longitude,
    Expression<double>? reportlong,
    Expression<double>? distance,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (location != null) 'event_location': location,
      if (datetime != null) 'event_datetime': datetime,
      if (type != null) 'event_type': type,
      if (latitude != null) 'event_latitude': latitude,
      if (reportlat != null) 'report_latitude': reportlat,
      if (longitude != null) 'event_longitude': longitude,
      if (reportlong != null) 'report_longitude': reportlong,
      if (distance != null) 'event_distance': distance,
      if (desc != null) 'event_descripcion': desc,
    });
  }

  FavoriteEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? location,
    Value<DateTime>? datetime,
    Value<String>? type,
    Value<double>? latitude,
    Value<double>? reportlat,
    Value<double>? longitude,
    Value<double>? reportlong,
    Value<double>? distance,
    Value<String>? desc,
  }) {
    return FavoriteEventsCompanion(
      id: id ?? this.id,
      location: location ?? this.location,
      datetime: datetime ?? this.datetime,
      type: type ?? this.type,
      latitude: latitude ?? this.latitude,
      reportlat: reportlat ?? this.reportlat,
      longitude: longitude ?? this.longitude,
      reportlong: reportlong ?? this.reportlong,
      distance: distance ?? this.distance,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (location.present) {
      map['event_location'] = Variable<String>(location.value);
    }
    if (datetime.present) {
      map['event_datetime'] = Variable<DateTime>(datetime.value);
    }
    if (type.present) {
      map['event_type'] = Variable<String>(type.value);
    }
    if (latitude.present) {
      map['event_latitude'] = Variable<double>(latitude.value);
    }
    if (reportlat.present) {
      map['report_latitude'] = Variable<double>(reportlat.value);
    }
    if (longitude.present) {
      map['event_longitude'] = Variable<double>(longitude.value);
    }
    if (reportlong.present) {
      map['report_longitude'] = Variable<double>(reportlong.value);
    }
    if (distance.present) {
      map['event_distance'] = Variable<double>(distance.value);
    }
    if (desc.present) {
      map['event_descripcion'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteEventsCompanion(')
          ..write('id: $id, ')
          ..write('location: $location, ')
          ..write('datetime: $datetime, ')
          ..write('type: $type, ')
          ..write('latitude: $latitude, ')
          ..write('reportlat: $reportlat, ')
          ..write('longitude: $longitude, ')
          ..write('reportlong: $reportlong, ')
          ..write('distance: $distance, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteEventsTable favoriteEvents = $FavoriteEventsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteEvents];
}

typedef $$FavoriteEventsTableCreateCompanionBuilder =
    FavoriteEventsCompanion Function({
      Value<int> id,
      required String location,
      required DateTime datetime,
      required String type,
      Value<double> latitude,
      Value<double> reportlat,
      Value<double> longitude,
      Value<double> reportlong,
      Value<double> distance,
      required String desc,
    });
typedef $$FavoriteEventsTableUpdateCompanionBuilder =
    FavoriteEventsCompanion Function({
      Value<int> id,
      Value<String> location,
      Value<DateTime> datetime,
      Value<String> type,
      Value<double> latitude,
      Value<double> reportlat,
      Value<double> longitude,
      Value<double> reportlong,
      Value<double> distance,
      Value<String> desc,
    });

class $$FavoriteEventsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteEventsTable> {
  $$FavoriteEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get reportlat => $composableBuilder(
    column: $table.reportlat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get reportlong => $composableBuilder(
    column: $table.reportlong,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteEventsTable> {
  $$FavoriteEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get datetime => $composableBuilder(
    column: $table.datetime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get reportlat => $composableBuilder(
    column: $table.reportlat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get reportlong => $composableBuilder(
    column: $table.reportlong,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteEventsTable> {
  $$FavoriteEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get datetime =>
      $composableBuilder(column: $table.datetime, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get reportlat =>
      $composableBuilder(column: $table.reportlat, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get reportlong => $composableBuilder(
    column: $table.reportlong,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);
}

class $$FavoriteEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteEventsTable,
          FavoriteEvent,
          $$FavoriteEventsTableFilterComposer,
          $$FavoriteEventsTableOrderingComposer,
          $$FavoriteEventsTableAnnotationComposer,
          $$FavoriteEventsTableCreateCompanionBuilder,
          $$FavoriteEventsTableUpdateCompanionBuilder,
          (
            FavoriteEvent,
            BaseReferences<_$AppDatabase, $FavoriteEventsTable, FavoriteEvent>,
          ),
          FavoriteEvent,
          PrefetchHooks Function()
        > {
  $$FavoriteEventsTableTableManager(
    _$AppDatabase db,
    $FavoriteEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<DateTime> datetime = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> reportlat = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double> reportlong = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<String> desc = const Value.absent(),
              }) => FavoriteEventsCompanion(
                id: id,
                location: location,
                datetime: datetime,
                type: type,
                latitude: latitude,
                reportlat: reportlat,
                longitude: longitude,
                reportlong: reportlong,
                distance: distance,
                desc: desc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String location,
                required DateTime datetime,
                required String type,
                Value<double> latitude = const Value.absent(),
                Value<double> reportlat = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double> reportlong = const Value.absent(),
                Value<double> distance = const Value.absent(),
                required String desc,
              }) => FavoriteEventsCompanion.insert(
                id: id,
                location: location,
                datetime: datetime,
                type: type,
                latitude: latitude,
                reportlat: reportlat,
                longitude: longitude,
                reportlong: reportlong,
                distance: distance,
                desc: desc,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteEventsTable,
      FavoriteEvent,
      $$FavoriteEventsTableFilterComposer,
      $$FavoriteEventsTableOrderingComposer,
      $$FavoriteEventsTableAnnotationComposer,
      $$FavoriteEventsTableCreateCompanionBuilder,
      $$FavoriteEventsTableUpdateCompanionBuilder,
      (
        FavoriteEvent,
        BaseReferences<_$AppDatabase, $FavoriteEventsTable, FavoriteEvent>,
      ),
      FavoriteEvent,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteEventsTableTableManager get favoriteEvents =>
      $$FavoriteEventsTableTableManager(_db, _db.favoriteEvents);
}
