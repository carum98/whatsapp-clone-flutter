part of 'chats_bloc.dart';

@immutable
abstract class ChatsEvent {}

class ChatsFetch extends ChatsEvent {}

class ChatsUpdateMessage extends ChatsEvent {
  final String chatId;
  final Message message;

  ChatsUpdateMessage({required this.chatId, required this.message});
}
