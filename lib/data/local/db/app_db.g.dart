// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ErrorTable extends Error with TableInfo<$ErrorTable, ErrorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ErrorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'error_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errCodeMeta =
      const VerificationMeta('errCode');
  @override
  late final GeneratedColumn<String> errCode = GeneratedColumn<String>(
      'err_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errDateMeta =
      const VerificationMeta('errDate');
  @override
  late final GeneratedColumn<DateTime> errDate = GeneratedColumn<DateTime>(
      'err_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, deviceId, errCode, errDate];
  @override
  String get aliasedName => _alias ?? 'error';
  @override
  String get actualTableName => 'error';
  @override
  VerificationContext validateIntegrity(Insertable<ErrorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('error_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['error_id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('err_code')) {
      context.handle(_errCodeMeta,
          errCode.isAcceptableOrUnknown(data['err_code']!, _errCodeMeta));
    } else if (isInserting) {
      context.missing(_errCodeMeta);
    }
    if (data.containsKey('err_date')) {
      context.handle(_errDateMeta,
          errDate.isAcceptableOrUnknown(data['err_date']!, _errDateMeta));
    } else if (isInserting) {
      context.missing(_errDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ErrorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ErrorData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}error_id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      errCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}err_code'])!,
      errDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}err_date'])!,
    );
  }

  @override
  $ErrorTable createAlias(String alias) {
    return $ErrorTable(attachedDatabase, alias);
  }
}

class ErrorData extends DataClass implements Insertable<ErrorData> {
  final int id;
  final String deviceId;
  final String errCode;
  final DateTime errDate;
  const ErrorData(
      {required this.id,
      required this.deviceId,
      required this.errCode,
      required this.errDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['error_id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['err_code'] = Variable<String>(errCode);
    map['err_date'] = Variable<DateTime>(errDate);
    return map;
  }

  ErrorCompanion toCompanion(bool nullToAbsent) {
    return ErrorCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      errCode: Value(errCode),
      errDate: Value(errDate),
    );
  }

  factory ErrorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ErrorData(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      errCode: serializer.fromJson<String>(json['errCode']),
      errDate: serializer.fromJson<DateTime>(json['errDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'errCode': serializer.toJson<String>(errCode),
      'errDate': serializer.toJson<DateTime>(errDate),
    };
  }

  ErrorData copyWith(
          {int? id, String? deviceId, String? errCode, DateTime? errDate}) =>
      ErrorData(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        errCode: errCode ?? this.errCode,
        errDate: errDate ?? this.errDate,
      );
  @override
  String toString() {
    return (StringBuffer('ErrorData(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('errCode: $errCode, ')
          ..write('errDate: $errDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceId, errCode, errDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErrorData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.errCode == this.errCode &&
          other.errDate == this.errDate);
}

class ErrorCompanion extends UpdateCompanion<ErrorData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> errCode;
  final Value<DateTime> errDate;
  const ErrorCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.errCode = const Value.absent(),
    this.errDate = const Value.absent(),
  });
  ErrorCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    required String errCode,
    required DateTime errDate,
  })  : deviceId = Value(deviceId),
        errCode = Value(errCode),
        errDate = Value(errDate);
  static Insertable<ErrorData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? errCode,
    Expression<DateTime>? errDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'error_id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (errCode != null) 'err_code': errCode,
      if (errDate != null) 'err_date': errDate,
    });
  }

  ErrorCompanion copyWith(
      {Value<int>? id,
      Value<String>? deviceId,
      Value<String>? errCode,
      Value<DateTime>? errDate}) {
    return ErrorCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      errCode: errCode ?? this.errCode,
      errDate: errDate ?? this.errDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['error_id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (errCode.present) {
      map['err_code'] = Variable<String>(errCode.value);
    }
    if (errDate.present) {
      map['err_date'] = Variable<DateTime>(errDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ErrorCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('errCode: $errCode, ')
          ..write('errDate: $errDate')
          ..write(')'))
        .toString();
  }
}

class $CallTable extends Call with TableInfo<$CallTable, CallData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CallTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'call_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errCodeMeta =
      const VerificationMeta('errCode');
  @override
  late final GeneratedColumn<String> errCode = GeneratedColumn<String>(
      'call_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, deviceId, errCode];
  @override
  String get aliasedName => _alias ?? 'call';
  @override
  String get actualTableName => 'call';
  @override
  VerificationContext validateIntegrity(Insertable<CallData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('call_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['call_id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('call_code')) {
      context.handle(_errCodeMeta,
          errCode.isAcceptableOrUnknown(data['call_code']!, _errCodeMeta));
    } else if (isInserting) {
      context.missing(_errCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CallData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CallData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}call_id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      errCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}call_code'])!,
    );
  }

  @override
  $CallTable createAlias(String alias) {
    return $CallTable(attachedDatabase, alias);
  }
}

class CallData extends DataClass implements Insertable<CallData> {
  final int id;
  final String deviceId;
  final String errCode;
  const CallData(
      {required this.id, required this.deviceId, required this.errCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['call_id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['call_code'] = Variable<String>(errCode);
    return map;
  }

  CallCompanion toCompanion(bool nullToAbsent) {
    return CallCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      errCode: Value(errCode),
    );
  }

  factory CallData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CallData(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      errCode: serializer.fromJson<String>(json['errCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'errCode': serializer.toJson<String>(errCode),
    };
  }

  CallData copyWith({int? id, String? deviceId, String? errCode}) => CallData(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        errCode: errCode ?? this.errCode,
      );
  @override
  String toString() {
    return (StringBuffer('CallData(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('errCode: $errCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceId, errCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CallData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.errCode == this.errCode);
}

class CallCompanion extends UpdateCompanion<CallData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> errCode;
  const CallCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.errCode = const Value.absent(),
  });
  CallCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    required String errCode,
  })  : deviceId = Value(deviceId),
        errCode = Value(errCode);
  static Insertable<CallData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? errCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'call_id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (errCode != null) 'call_code': errCode,
    });
  }

  CallCompanion copyWith(
      {Value<int>? id, Value<String>? deviceId, Value<String>? errCode}) {
    return CallCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      errCode: errCode ?? this.errCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['call_id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (errCode.present) {
      map['call_code'] = Variable<String>(errCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CallCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('errCode: $errCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $ErrorTable error = $ErrorTable(this);
  late final $CallTable call = $CallTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [error, call];
}
