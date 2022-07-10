part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}

class MessagesFetch extends MessagesEvent {}

class MessagesAdd extends MessagesEvent {
  final Message message;

  MessagesAdd(this.message);
}

class MessagesGetMessage extends MessagesEvent {
  final String messageId;

  MessagesGetMessage(this.messageId);

  MessagesGetMessage.fromSocket(Map<String, dynamic> payload) : messageId = payload['message_id'];
}

class MessagesReadMessages extends MessagesEvent {
  final List<Map<String, String>> messages;

  MessagesReadMessages(this.messages);

  MessagesReadMessages.fromSocket(List<dynamic> payload)
      : messages = payload.map((e) => Map<String, String>.from(e)).toList();
}
