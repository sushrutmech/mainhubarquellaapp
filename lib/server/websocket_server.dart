import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:xenderclone/database/database_helper.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';

class ClientInfo {
  String id;
  String ip;

  ClientInfo(this.id, this.ip);
}

class Message {
  String clientId;
  String clientIp;
  dynamic data;

  Message(this.clientId, this.clientIp, this.data);
}

class WebSocketServer {
  List<ClientInfo> _clientsInfo = [];
  List<Message> _messages = [];
  DatabaseHelper _databaseHelper = DatabaseHelper();
  HttpServer? _httpServer;
  void startServer() async {
    final server = await HttpServer.bind("192.168.1.100", 8080);
    print('Server started port 8080');
    _httpServer = server;

    await for (var request in server) {
      if (WebSocketTransformer.isUpgradeRequest(request)) {
        _handleWebSocket(request);
      }
    }
  }

  void stopServer() {
    _httpServer?.close();
    print('Server stopped');
    _clientsInfo.clear();
    _messages.clear();
  }

  void _handleWebSocket(HttpRequest request) async {
    final socket = await WebSocketTransformer.upgrade(request);
    final clientId = UniqueKey().toString();
    Duration globalDuration = const Duration(seconds: 0);
    final clientIp = request.headers.value('X-Forwarded-For') ??
        request.connectionInfo!.remoteAddress.address;

    Timer timeSync = Timer.periodic(const Duration(hours: 12), (Timer t) {
      socket.add(DateTime.now().toString());
    });

    print('Client connected: $clientId, IP: $clientIp');
    _clientsInfo.add(ClientInfo(clientId, clientIp));
    DateTime nodehubTime;
    socket.listen(
      (data) {
        if (DateTime.tryParse(data) == null) {
          _saveMessageToDatabase(clientId, clientIp, data);
          nodehubTime = DateTime.now().subtract(globalDuration);
          print('${DateTime.now()} $nodehubTime');
        } else {
          globalDuration = DateTime.now().difference(DateTime.parse(data));
          print(globalDuration);
        }
      },
      onDone: () {
        print('Client disconnected: $clientId');
        _clientsInfo.removeWhere((client) => client.id == clientId);
      },
    );
  }

  Future<void> _saveMessageToDatabase(
      String clientId, String clientIp, String data) async {
    await _databaseHelper.insertMessage(clientId, clientIp, data);
  }
}
