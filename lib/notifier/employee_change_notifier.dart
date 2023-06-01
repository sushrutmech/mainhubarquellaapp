import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class EmployeeChangeNotifier extends ChangeNotifier {
  AppDB? _appDB;

  void initAppDB(AppDB db) {
    _appDB = db;
  }

  List<EmployeeData> _employeeListFuture = [];
  List<EmployeeData> get employeeListFuture => _employeeListFuture;
  List<EmployeeData> _employeeListStream = [];
  List<EmployeeData> get employeeListStream => _employeeListStream;
  EmployeeData? _employeeData;
  EmployeeData? get employeeData => _employeeData;

  String _error = '';
  String get error => _error;
  bool _added = false;
  bool get added => _added;
  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;
  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  void getEmployeeFuture() {
    _appDB?.getEmployees().then((value) {
      _employeeListFuture = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  void getEmployeeStream() {
    _appDB?.getEmployeeStream().listen((event) {
      _employeeListStream = event;
    });
    notifyListeners();
  }

  void getSingleEmployee(int id) {
    _appDB?.getEmployee(id).then((value) {
      _employeeData = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  void createEmployee(EmployeeCompanion entity) {
    _appDB?.insertEmployee(entity).then((value) {
      _added = value >= 1 ? true : false;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }

  void updateEmployee(EmployeeCompanion entity) {
    _appDB?.updateEmployee(entity).then((value) {
      _isUpdated = value;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }

  void deleteEmployee(int id) {
    _appDB?.deleteEmployee(id).then((value) {
      _isDeleted = value >= 1 ? true : false;
    }).onError((error, stackTrace) {
      _error = error.toString();
    });
  }
}
