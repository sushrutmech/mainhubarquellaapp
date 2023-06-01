import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorsStreamScreen extends StatefulWidget {
  const ErrorsStreamScreen({super.key});

  @override
  State<ErrorsStreamScreen> createState() => _ErrorsStreamScreenState();
}

class _ErrorsStreamScreenState extends State<ErrorsStreamScreen> {
  late AppDB _appDB;
  @override
  void initState() {
    super.initState();
    _appDB = AppDB();
  }

  @override
  void dispose() {
    super.dispose();
    _appDB.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Errors'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<ErrorData>>(
        stream: _appDB.getErrorStream(),
        builder: (context, snapshot) {
          final List<ErrorData>? errors = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (errors != null) {
            return ListView.builder(
              itemCount: errors.length,
              itemBuilder: (context, index) {
                final error = errors[index];
                return Card(
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
                          'ErrorId: ${error.id}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          'DeviceId: ${error.deviceId}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          'ErrorCode: ${error.errCode}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Text('No data found');
        },
      ),
    );
  }
}
