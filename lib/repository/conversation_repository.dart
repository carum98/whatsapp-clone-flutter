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
}
