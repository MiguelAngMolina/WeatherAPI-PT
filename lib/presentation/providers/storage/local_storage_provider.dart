import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapi_gse/infrastructure/datasources/drift_datasource.dart';
import 'package:weatherapi_gse/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref){

  return LocalStorageRepositoryImpl(DriftDatasource());
});