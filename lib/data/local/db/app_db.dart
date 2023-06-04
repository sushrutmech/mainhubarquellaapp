import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../entity/error_entity.dart';
import '../entity/call_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'call.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Error, Call])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertError(ErrorCompanion entity) async {
    return await into(error).insert(entity);
  }

  Stream<List<ErrorData>> getErrorStream() {
    return select(error).watch();
  }

  Stream<List<CallData>> getCallStream() {
    return select(call).watch();
  }
}
