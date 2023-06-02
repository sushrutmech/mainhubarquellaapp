import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';

class CallsStreamScreen extends StatefulWidget {
  const CallsStreamScreen({super.key});

  @override
  State<CallsStreamScreen> createState() => _CallsStreamScreenState();
}

class _CallsStreamScreenState extends State<CallsStreamScreen> {
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
        title: const Text('Device calls'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<CallData>>(
        stream: _appDB.getCallStream(),
        builder: (context, snapshot) {
          final List<CallData>? calls = snapshot.data;
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
          if (calls!.isEmpty) {
            return const Text('No data found');
          }
          return ListView.builder(
            itemCount: calls.length,
            itemBuilder: (context, index) {
              final call = calls[index];
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
                      const Text('No data found'),
                      Text(
                        call.id.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        call.deviceId.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        call.errCode.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          return const Text('No data found');
        },
      ),
    );
  }
}
