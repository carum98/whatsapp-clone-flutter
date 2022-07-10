import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/widgets/avatar_image.dart';

import '../../router/route_names.dart';

class TileChat extends StatelessWidget {
  final Chat chat;
  const TileChat({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarImage(path: chat.avatar),
      title: Text(chat.name),
      subtitle: Text(chat.message.content),
      trailing: Text(
        DateFormat('h:mm a').format(chat.message.date),
        style: const TextStyle(fontSize: 12),
      ),
      onTap: () => Navigator.pushNamed(context, CONVERSATION_PAGE, arguments: chat),
    );
  }
}
