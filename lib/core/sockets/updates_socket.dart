// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/app_config.dart';

class UpdatesSocket {
  final AuthStorage storage;
  UpdatesSocket(this.storage);

  late IO.Socket _socket;

  Future<IO.Socket> connect() async {
    final token = await storage.getToken();

    _socket = IO.io('${AppConfig.baseUrl}/updates', {
      'transports': ['websocket'],
      'auth': {'token': token}
    });

    _socket.onConnect((data) => print('Connected'));

    return _socket;
  }

  void disconnect() {
    _socket.dispose();
  }
}
