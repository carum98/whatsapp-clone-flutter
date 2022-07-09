import 'package:whatsapp_clone_flutter/core/network/client_http.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';

class ChatRepository {
  final Http http;
  const ChatRepository(this.http);

  Future<List<Chat>> getChats() async {
    final data = await http.response<List<Chat>>(
      url: '/chats',
      mapper: (json) {
        final data = json['data'] as List<dynamic>;

        return data.map((e) => Chat.fromJson(e)).toList();
      },
    );

    return data ?? [];
  }
}
