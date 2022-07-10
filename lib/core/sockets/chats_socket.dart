import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone_flutter/core/app_config.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';

class ChatsSocket {
  final AuthStorage storage;
  final Chat chat;

  ChatsSocket({required this.storage, required this.chat});

  late IO.Socket _socket;

  Future<void> connect() async {
    final token = await storage.getToken();

    _socket = IO.io('${AppConfig.baseUrl}/chats', {
      'transports': ['websocket'],
      'forceNew': true,
      'query': {
        'chat_id': chat.id,
      },
      'auth': {
        'token': token,
      },
    });

    _socket.onConnect((data) => print('Connected for chat ${chat.id}'));
  }

  void emit(String event, [dynamic data]) {
    _socket.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  void disconnect() {
    print('Disconnected chat socket for chat ${chat.id}');
    _socket.dispose();
  }
}
