part of 'status_chat_cubit.dart';

@immutable
abstract class StatusChatState {}

class StatusChatInitial extends StatusChatState {}

class StatusChatTyping extends StatusChatState {}
