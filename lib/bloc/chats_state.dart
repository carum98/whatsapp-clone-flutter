part of 'chats_bloc.dart';

@immutable
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<Chat> chats;

  ChatsLoaded(this.chats);
}

class ChatsError extends ChatsState {}

class ChatsEmpty extends ChatsState {}
