// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/models/message_model.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final ConversationRepository _conversationRepository;

  MessagesBloc(this._conversationRepository) : super(MessagesInitial()) {
    on<MessagesFetch>(_fetchMessages);
    on<MessagesAdd>(_addMessage);
  }

  Chat get currentChat => _conversationRepository.chat;

  Future<void> _fetchMessages(MessagesFetch event, Emitter<MessagesState> emit) async {
    try {
      emit(MessagesLoading());

      final messages = await _conversationRepository.getMessages();

      if (messages.isEmpty) {
        emit(MessagesEmpty());
      } else {
        emit(MessagesLoaded(messages));
      }
    } catch (e) {
      emit(MessagesError());
    }
  }

  Future<void> _addMessage(MessagesAdd event, Emitter<MessagesState> emit) async {
    try {
      emit((state as MessagesLoaded).addMessage(event.message));
    } catch (e) {
      emit(MessagesError());
    }
  }
}
