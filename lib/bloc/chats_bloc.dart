// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone_flutter/core/sockets/updates_socket.dart';
import 'package:whatsapp_clone_flutter/models/message_model.dart';

import 'package:whatsapp_clone_flutter/repository/chats_repository.dart';

import '../models/chats_model.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatRepository _chatRepository;
  final UpdatesSocket _socket;

  ChatsBloc(this._chatRepository, this._socket) : super(ChatsInitial()) {
    on<ChatsFetch>(_fetchChats);
    on<ChatsUpdateMessage>(_updateMessage);
    on<ChatsReadMessages>(_readMessages);

    _setup();
  }

  void _setup() async {
    await _socket.connect();

    _socket.on('updates:message', (payload) {
      add(ChatsUpdateMessage.fromSocket(payload));
    });

    _socket.on('updates:read', (payload) {
      add(ChatsReadMessages.fromSocket(payload));
    });
  }

  Future<void> _fetchChats(ChatsFetch event, Emitter<ChatsState> emit) async {
    try {
      emit(ChatsLoading());

      final chats = await _chatRepository.getChats();

      if (chats.isEmpty) {
        emit(ChatsEmpty());
      } else {
        emit(ChatsLoaded(chats));
      }
    } catch (e) {
      emit(ChatsError());
    }
  }

  FutureOr<void> _updateMessage(ChatsUpdateMessage event, Emitter<ChatsState> emit) {
    final loaded = state as ChatsLoaded;

    emit(ChatsLoaded(
      [
        loaded.chats.firstWhere((chat) => chat.id == event.chatId).copyWith(message: event.message),
        ...loaded.chats.where((chat) => chat.id != event.chatId),
      ],
    ));
  }

  FutureOr<void> _readMessages(ChatsReadMessages event, Emitter<ChatsState> emit) {
    final loaded = state as ChatsLoaded;

    emit(ChatsLoaded(
      loaded.chats.map((chat) {
        if (event.messages.any((message) => message['chat_id'] == chat.id)) {
          return chat.copyWith(message: chat.message.copyWith(isRead: true));
        }

        return chat;
      }).toList(),
    ));
  }

  @override
  Future<void> close() {
    _socket.disconnect();
    return super.close();
  }
}
