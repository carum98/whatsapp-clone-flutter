// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:whatsapp_clone_flutter/repository/chats_repository.dart';

import '../models/chats_model.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatRepository _chatRepository;

  ChatsBloc(this._chatRepository) : super(ChatsInitial()) {
    on<ChatsFetch>(_fetchChats);
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
}
