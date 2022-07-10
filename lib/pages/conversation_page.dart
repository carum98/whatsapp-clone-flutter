import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_appbar.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_panel.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/input_message.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: const [
            Expanded(
              child: ConversationPanel(),
            ),
            SafeArea(
              child: InputMessage(),
            ),
          ],
        ),
      ),
    );
  }
}
