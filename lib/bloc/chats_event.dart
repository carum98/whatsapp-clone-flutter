part of 'chats_bloc.dart';

@immutable
abstract class ChatsEvent {}

class ChatsFetch extends ChatsEvent {}

class ChatsUpdateMessage extends ChatsEvent {
  final String chatId;
  final Message message;

  ChatsUpdateMessage({required this.chatId, required this.message});

  ChatsUpdateMessage.fromSocket(Map<String, dynamic> payload)
      : chatId = payload['chat_id'],
        message = Message.fromJson(payload['message']);
}

class ChatsReadMessages extends ChatsEvent {
  final List<Map<String, String>> messages;

  ChatsReadMessages({required this.messages});

  ChatsReadMessages.fromSocket(List<dynamic> payload)
      : messages = payload.map((e) => Map<String, String>.from(e)).toList();
}
