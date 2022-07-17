// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone_flutter/core/sockets/chats_socket.dart';

part 'status_chat_state.dart';

class StatusChatCubit extends Cubit<StatusChatState> {
  final ChatsSocket _socket;

  StatusChatCubit(this._socket) : super(StatusChatInitial()) {
    _socket.on('chat:typing', (payload) {
      if (state is StatusChatInitial) {
        emit(StatusChatTyping());
      } else {
        emit(StatusChatInitial());
      }
    });
  }

  void typing() {
    _socket.emit('chat:typing');
  }
}
