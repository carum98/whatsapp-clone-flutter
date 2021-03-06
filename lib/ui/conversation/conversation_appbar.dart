import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/cubit/status_chat_cubit.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';
import 'package:whatsapp_clone_flutter/widgets/avatar_image.dart';

class ConversationAppBar extends StatelessWidget with PreferredSizeWidget {
  const ConversationAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final chat = context.read<ConversationRepository>().chat;

    return AppBar(
      leadingWidth: 30,
      title: Row(
        children: [
          AvatarImage(path: chat.avatar),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: const TextStyle(fontSize: 18),
              ),
              BlocBuilder<StatusChatCubit, StatusChatState>(
                builder: (_, state) {
                  if (state is StatusChatTyping) {
                    return const Text('Typing...', style: TextStyle(fontSize: 12));
                  }

                  return Container();
                },
              ),
            ],
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}
