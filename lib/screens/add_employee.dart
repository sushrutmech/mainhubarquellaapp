import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;

import 'package:device_signal/widgets/custem_text_form_field.dart';
import 'package:device_signal/widgets/custom_date_picker_form_field.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  DateTime? _birthDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add employee'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: addEmployee, icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _userNameController,
                txtLabel: 'User name',
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                  controller: _firstNameController, txtLabel: 'First name'),
              const SizedBox(height: 8),
              CustomTextFormField(
                  controller: _lastNameController, txtLabel: 'Last name'),
              const SizedBox(height: 8),
              CustomDatePicker(
                  controller: _birthDateController,
                  txtLabel: 'Birth Date',
                  callback: () {
                    pickBirthDate(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickBirthDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _birthDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: const ColorScheme.light(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      onSurface: Colors.black)),
              child: child ?? const Text(''),
            ));
    if (newDate == null) {
      return;
    }
    setState(() {
      _birthDate = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _birthDateController.text = dob;
    });
  }

  void addEmployee() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final entity = EmployeeCompanion(
        userName: drift.Value(_userNameController.text),
        firstName: drift.Value(_firstNameController.text),
        lastName: drift.Value(_lastNameController.text),
        birthDate: drift.Value(_birthDate!),
      );
      Provider.of<AppDB>(context, listen: false).insertEmployee(entity).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                      backgroundColor: Colors.deepOrange,
                      content: Text('New employee inserted $value'),
                      actions: [
                    TextButton(
                        onPressed: () => ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner(),
                        child: const Text('Close',
                            style: TextStyle(color: Colors.white)))
                  ])));
    }
  }
}
