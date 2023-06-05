import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:xenderclone/database/database_helper.dart';

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
  WebSocketChannel? _channel;

  void startServer() async {
    final server = await HttpServer.bind("192.168.1.2", 8080);
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
        final message = Message(clientId, clientIp, jsonMessage);
        _messages.add(message);

        _saveMessageToDatabase(clientId, clientIp, json.encode(jsonMessage));
      },
      onDone: () {
        print('Client disconnected: $clientId');
        _clientsInfo.removeWhere((client) => client.id == clientId);
      },
    );
  }

  Future<void> _saveMessageToDatabase(String clientId, String clientIp, String data) async {
    await _databaseHelper.insertMessage(clientId, clientIp, data);
  }
}
