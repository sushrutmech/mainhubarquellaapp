import 'package:drift/drift.dart';

class Call extends Table {
  IntColumn get id => integer().named('call_id').autoIncrement()();
  TextColumn get deviceId => text().named('device_id')();
  TextColumn get errCode => text().named('call_code')();
}
