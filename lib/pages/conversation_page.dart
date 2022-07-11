import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_appbar.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_panel.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/input_message.dart';
import 'package:whatsapp_clone_flutter/widgets/emoji_picker.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        image: const DecorationImage(
          image: AssetImage('assets/ws-bg.png'),
          opacity: 0.1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ConversationAppBar(),
        body: Column(
          children: [
            const Expanded(
              child: ConversationPanel(),
            ),
            InputMessage(
              textController: textController,
              onSend: () => context
                  .read<ConversationRepository>()
                  .sendMessage(textController.text)
                  .then((value) => textController.clear()),
            ),
            EmojiPicker(
                onEmojiSelected: (emoji) => textController.text += emoji,
                onBackPressed: () {
                  textController.text =
                      textController.text.substring(0, textController.text.length - 2);
                }),
          ],
        ),
      ),
    );
  }
}
