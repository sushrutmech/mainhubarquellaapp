import 'package:flutter/material.dart';
import 'package:xenderclone/server/websocket_server.dart';
import 'package:xenderclone/database/database_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Server',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/database': (context) => DatabaseScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebSocketServer _webSocketServer = WebSocketServer();
  bool _isServerRunning = false;

  @override
  void dispose() {
    _webSocketServer.stopServer();
    super.dispose();
  }

  void _toggleServerStatus() {
    setState(() {
      _isServerRunning = !_isServerRunning;
    });

    if (_isServerRunning) {
      _webSocketServer.startServer();
    } else {
      _webSocketServer.stopServer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Server'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isServerRunning ? 'Server Running' : 'Server Stopped',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleServerStatus,
              child: Text(_isServerRunning ? 'Stop Server' : 'Start Server'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/database');
              },
              child: Text('View Database'),
            ),
          ],
        ),
      ),
    );
  }
}