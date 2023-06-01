import 'package:device_signal/screens/calls_stream.dart';
import 'package:flutter/material.dart';
import 'package:device_signal/screens/errors_stream.dart';
import 'package:device_signal/server/websocket_server.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WebSocketServer _webSocketServer = WebSocketServer();
  bool _isServerRunning = false;
  int index = 0;
  bool _floatingIcon = false;
  bool _floatingIconText = false;
  final pages = const [CallsStreamScreen(), ErrorsStreamScreen()];
  @override
  void initState() {
    super.initState();
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: _floatingIconText
            ? const Text('Disconnect from device')
            : const Text('Connect to device'),
        icon: _floatingIcon ? const Icon(Icons.cancel) : const Icon(Icons.add),
        onPressed: () {
          _toggleServerStatus();
          setState(() {
            _floatingIcon = !_floatingIcon;
            _floatingIconText = !_floatingIconText;
          });
        },
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        backgroundColor: Colors.blue.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              activeIcon: Icon(Icons.list_outlined),
              label: 'Errors'),
        ],
      ),
    );
  }
}
