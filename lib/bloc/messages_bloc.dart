// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone_flutter/core/sockets/chats_socket.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/models/message_model.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final ConversationRepository _conversationRepository;
  final ChatsSocket _socket;

  MessagesBloc(this._conversationRepository, this._socket) : super(MessagesInitial()) {
    on<MessagesFetch>(_fetchMessages);
    on<MessagesAdd>(_addMessage);
    on<MessagesGetMessage>(_getMessage);
    on<MessagesReadMessages>(_readMessages);

    _setup();
  }

  Future<void> _setup() async {
    await _socket.connect();

    _socket.on('chat:message', (payload) {
      add(MessagesGetMessage.fromSocket(payload));
    });

    _socket.on('chat:read', (payload) {
      add(MessagesReadMessages.fromSocket(payload));
    });
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

  Future<void> _getMessage(MessagesGetMessage event, Emitter<MessagesState> emit) async {
    try {
      final message = await _conversationRepository.getMessage(event.messageId);

      if (!message!.isMine) {
        _socket.emit('chat:read', message.id);
      }

      add(MessagesAdd(message));
    } catch (e) {
      emit(MessagesError());
    }
  }

  FutureOr<void> _readMessages(MessagesReadMessages event, Emitter<MessagesState> emit) {
    final loaded = state as MessagesLoaded;

    emit(MessagesLoaded(
      loaded.messages.map((message) {
        if (event.messages.any((value) => value['message_id'] == message.id)) {
          return message.copyWith(isRead: true);
        }

        return message;
      }).toList(),
    ));
  }

  @override
  Future<void> close() {
    _socket.disconnect();
    return super.close();
  }
}
