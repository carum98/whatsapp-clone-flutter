import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/bloc/messages_bloc.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/tile_message.dart';

class ConversationPanel extends StatefulWidget {
  const ConversationPanel({Key? key}) : super(key: key);

  @override
  State<ConversationPanel> createState() => _ConversationPanelState();
}

class _ConversationPanelState extends State<ConversationPanel> {
  @override
  void initState() {
    super.initState();

    context.read<MessagesBloc>().add(MessagesFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is MessagesInitial || state is MessagesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MessagesEmpty) {
          return const Center(
            child: Text('No messages'),
          );
        }

        if (state is MessagesError) {
          return const Center(
            child: Text('Error'),
          );
        }

        if (state is MessagesLoaded) {
          return ListView.builder(
            itemCount: state.messages.length,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final message = state.messages[index];

              return TileMessage(message: message);
            },
          );
        }

        return Container();
      },
    );
  }
}
