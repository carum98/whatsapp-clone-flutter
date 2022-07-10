import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/bloc/messages_bloc.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';

class InputMessage extends StatelessWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = '';
    final textController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sentiment_very_satisfied_rounded, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                    ),
                    onChanged: (value) => message = value,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file_rounded, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt, size: 18),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ConversationRepository>().sendMessage(message).then((value) {
              if (value != null) {
                context.read<MessagesBloc>().add(MessagesAdd(value));

                textController.clear();
                message = '';
              }
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: const Color(0xFF09a784),
            padding: const EdgeInsets.all(8),
          ),
          child: const Icon(
            Icons.send,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
