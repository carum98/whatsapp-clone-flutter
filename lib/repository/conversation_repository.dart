import 'package:whatsapp_clone_flutter/core/network/client_http.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/models/message_model.dart';

class ConversationRepository {
  final Http http;
  final Chat chat;
  const ConversationRepository({required this.http, required this.chat});

  Future<List<Message>> getMessages() async {
    final data = await http.response<List<Message>>(
      url: '/chats/${chat.id}/messages',
      mapper: (json) {
        final data = json['data'] as List<dynamic>;

        return data.map((e) => Message.fromJson(e)).toList();
      },
    );

    return data ?? [];
  }

  Future<Message?> sendMessage(String message) async {
    final data = await http.response<Message>(
      url: '/messages',
      method: Method.post,
      data: {
        'content': message,
        'chat_id': chat.id,
      },
      mapper: (json) => Message.fromJson(json['data']),
    );

    return data;
  }
}
