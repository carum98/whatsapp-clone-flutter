// ignore_for_file: avoid_print, library_prefixes

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/app_config.dart';

class UpdatesSocket {
  final AuthStorage storage;
  UpdatesSocket(this.storage);

  late IO.Socket _socket;

  Future<void> connect() async {
    final token = await storage.getToken();

    _socket = IO.io('${AppConfig.baseUrl}/updates', {
      'transports': ['websocket'],
      'auth': {'token': token}
    });

    _socket.onConnect((data) => print('Connected'));
  }

  void emit(String event, [dynamic data]) {
    _socket.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  void disconnect() {
    _socket.dispose();
  }
}
