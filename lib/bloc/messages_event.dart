part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}

class MessagesFetch extends MessagesEvent {}

class MessagesAdd extends MessagesEvent {
  final Message message;

  MessagesAdd(this.message);
}
