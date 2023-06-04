import 'package:drift/drift.dart';

class Error extends Table {
  IntColumn get id => integer().named('error_id').autoIncrement()();
  TextColumn get deviceId => text().named('device_id')();
  TextColumn get errCode => text().named('err_code')();
  DateTimeColumn get errDate => dateTime().named('err_date')();
}
