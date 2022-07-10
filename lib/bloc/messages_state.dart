part of 'messages_bloc.dart';

@immutable
abstract class MessagesState {}

class MessagesInitial extends MessagesState {}

class MessagesLoading extends MessagesState {}

class MessagesLoaded extends MessagesState {
  final List<Message> messages;

  MessagesLoaded(this.messages);
}

class MessagesError extends MessagesState {}

class MessagesEmpty extends MessagesState {}
