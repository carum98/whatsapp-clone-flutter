import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';
import 'package:whatsapp_clone_flutter/core/sockets/updates_socket.dart';
import 'package:whatsapp_clone_flutter/repository/chats_repository.dart';
import 'package:whatsapp_clone_flutter/ui/chats/tile_chat.dart';

import '../../bloc/chats_bloc.dart';

class ListChats extends StatelessWidget {
  const ListChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatsBloc(ChatRepository(getIt()), UpdatesSocket(getIt())),
      child: const _List(),
    );
  }
}

class _List extends StatefulWidget {
  const _List({Key? key}) : super(key: key);

  @override
  State<_List> createState() => __ListState();
}

class __ListState extends State<_List> {
  @override
  void initState() {
    super.initState();

    context.read<ChatsBloc>().add(ChatsFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (_, state) {
        if (state is ChatsInitial || state is ChatsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ChatsLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: state.chats.length,
            itemBuilder: (_, index) => TileChat(chat: state.chats[index]),
          );
        }

        if (state is ChatsError) {
          return const Center(
            child: Text('Error'),
          );
        }

        if (state is ChatsEmpty) {
          return const Center(
            child: Text('No chats'),
          );
        }

        return Container();
      },
    );
  }
}
