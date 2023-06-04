import 'dart:convert';
import 'dart:io';
import 'package:device_signal/data/local/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final clientId = "192.168.1.101";

  void startServer() async {
    try {
      final server = await HttpServer.bind(clientId, 8080);
      print('Server started port 8080');
      await for (var request in server) {
        if (WebSocketTransformer.isUpgradeRequest(request)) {
          _handleWebSocket(request);
        }
      }
    } catch (error) {
      print('$error');
      _saveMessageToDatabase(clientId, '', error.toString());
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

    socket.listen(onError: (error) {}, (data) {
      final jsonMessage = json.decode(data);
      _saveMessageToDatabase(clientId, clientIp, jsonMessage['message']);
    }, onDone: () {
      print('Client disconnected: $clientId');
      _clientsInfo.removeWhere((client) => client.id == clientId);
    });
  }

  Future<void> _saveMessageToDatabase(
      String clientId, String clientIp, String data) async {
    print(TimeOfDay.fromDateTime(DateTime.now()));
    final AppDB _appDb = AppDB();
    final entity = ErrorCompanion(
        deviceId: drift.Value(clientId),
        errCode: drift.Value(data),
        errDate: drift.Value(
          DateTime.now(),
        ));
    _appDb.insertError(entity).then((value) => print(value));
  }
}
