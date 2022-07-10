part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}

class MessagesFetch extends MessagesEvent {}
