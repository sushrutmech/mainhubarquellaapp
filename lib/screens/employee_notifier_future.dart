import 'package:device_signal/data/local/db/app_db.dart';
import 'package:device_signal/notifier/employee_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeNotifierFutureScreen extends StatefulWidget {
  const EmployeeNotifierFutureScreen({super.key});

  @override
  State<EmployeeNotifierFutureScreen> createState() =>
      _EmployeeNotifierFutureScreenState();
}

class _EmployeeNotifierFutureScreenState
    extends State<EmployeeNotifierFutureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employees =
        context.watch<EmployeeChangeNotifier>().employeeListFuture;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee Future'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (context, index) {
            final employee = employees[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit_employee',
                    arguments: employee.id);
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                        width: 1.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.id.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        employee.userName.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        employee.firstName.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        employee.lastName.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        employee.birthDate.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
