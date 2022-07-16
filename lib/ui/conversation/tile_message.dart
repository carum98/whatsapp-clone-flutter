import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone_flutter/models/message_model.dart';

class TileMessage extends StatelessWidget {
  final Message message;
  const TileMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: message.isMine
                ? Theme.of(context).colorScheme.secondaryContainer
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Text(
                message.content,
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(width: 8),
              Text(
                message.date != null ? DateFormat('h:mm a').format(message.date!) : '',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              if (message.isMine) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.done_all_outlined,
                  size: 13,
                  color: message.isRead ? const Color.fromARGB(255, 33, 219, 243) : Colors.grey,
                )
              ]
            ],
          ),
        ),
      ],
    );
  }
}
