import 'dart:convert';
import 'dart:io';
import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

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
  HttpServer? _httpServer;

  void startServer() async {
    final server = await HttpServer.bind("192.168.1.102", 8080);
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
    final clientIp = request.headers.value('X-Forwarded-For') ??
        request.connectionInfo!.remoteAddress.address;

    print('Client connected: $clientId, IP: $clientIp');

    _clientsInfo.add(ClientInfo(clientId, clientIp));

    socket.listen(
      (data) {
        final jsonMessage = json.decode(data);
        _saveMessageToDatabase(clientId, clientIp, jsonMessage['message']);
      },
      onDone: () {
        print('Client disconnected: $clientId');
        _clientsInfo.removeWhere((client) => client.id == clientId);
      },
    );
  }

  Future<void> _saveMessageToDatabase(
      String clientId, String clientIp, String data) async {
    final AppDB _appDb = AppDB();
    final entity = ErrorCompanion(
        deviceId: drift.Value(clientId), errCode: drift.Value(data));
    _appDb.insertError(entity).then((value) => print(value));
  }
}
