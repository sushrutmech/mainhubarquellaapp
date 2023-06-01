// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userName, firstName, lastName, birthDate];
  @override
  String get aliasedName => _alias ?? 'employee';
  @override
  String get actualTableName => 'employee';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
    );
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String userName;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  const EmployeeData(
      {required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.birthDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      userName: Value(userName),
      firstName: Value(firstName),
      lastName: Value(lastName),
      birthDate: Value(birthDate),
    );
  }

  factory EmployeeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
    };
  }

  EmployeeData copyWith(
          {int? id,
          String? userName,
          String? firstName,
          String? lastName,
          DateTime? birthDate}) =>
      EmployeeData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('birthDate: $birthDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userName, firstName, lastName, birthDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.birthDate == this.birthDate);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<DateTime> birthDate;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.birthDate = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  })  : userName = Value(userName),
        firstName = Value(firstName),
        lastName = Value(lastName),
        birthDate = Value(birthDate);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<DateTime>? birthDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (birthDate != null) 'birth_date': birthDate,
    });
  }

  EmployeeCompanion copyWith(
      {Value<int>? id,
      Value<String>? userName,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<DateTime>? birthDate}) {
    return EmployeeCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('birthDate: $birthDate')
          ..write(')'))
        .toString();
  }
}

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
  @override
  List<GeneratedColumn> get $columns => [id, deviceId, errCode];
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
  const ErrorData(
      {required this.id, required this.deviceId, required this.errCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['error_id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['err_code'] = Variable<String>(errCode);
    return map;
  }

  ErrorCompanion toCompanion(bool nullToAbsent) {
    return ErrorCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      errCode: Value(errCode),
    );
  }

  factory ErrorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ErrorData(
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

  ErrorData copyWith({int? id, String? deviceId, String? errCode}) => ErrorData(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        errCode: errCode ?? this.errCode,
      );
  @override
  String toString() {
    return (StringBuffer('ErrorData(')
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
      (other is ErrorData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.errCode == this.errCode);
}

class ErrorCompanion extends UpdateCompanion<ErrorData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> errCode;
  const ErrorCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.errCode = const Value.absent(),
  });
  ErrorCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    required String errCode,
  })  : deviceId = Value(deviceId),
        errCode = Value(errCode);
  static Insertable<ErrorData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? errCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'error_id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (errCode != null) 'err_code': errCode,
    });
  }

  ErrorCompanion copyWith(
      {Value<int>? id, Value<String>? deviceId, Value<String>? errCode}) {
    return ErrorCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      errCode: errCode ?? this.errCode,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ErrorCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('errCode: $errCode')
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
  late final $EmployeeTable employee = $EmployeeTable(this);
  late final $ErrorTable error = $ErrorTable(this);
  late final $CallTable call = $CallTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employee, error, call];
}
