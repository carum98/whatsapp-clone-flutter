import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_appbar.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/conversation_panel.dart';
import 'package:whatsapp_clone_flutter/ui/conversation/input_message.dart';
import 'package:whatsapp_clone_flutter/widgets/attachment_picker.dart';
import 'package:whatsapp_clone_flutter/widgets/emoji_picker.dart';

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
              child: _Input(),
            )
          ],
        ),
      ),
    );
  }
}

class _Input extends StatefulWidget {
  const _Input({Key? key}) : super(key: key);

  @override
  State<_Input> createState() => __InputState();
}

class __InputState extends State<_Input> {
  late TextEditingController textController;
  late FocusNode focusNode;

  PickerType? _pickerType;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    textController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputMessage(
          textController: textController,
          focusNode: focusNode,
          onPickerSelected: _onPickerSelected,
          onSend: _onSend,
        ),
        Offstage(
          offstage: _pickerType != PickerType.emoji,
          child: EmojiPicker(
            onEmojiSelected: (emoji) => textController.text += emoji,
            onBackPressed: _onBackPressed,
          ),
        ),
        Offstage(
          offstage: _pickerType != PickerType.file,
          child: const AttachmentPicker(),
        ),
      ],
    );
  }

  void _onSend() {
    context.read<ConversationRepository>().sendMessage(textController.text);
    textController.clear();
    focusNode.unfocus();
  }

  void _onBackPressed() {
    textController.text = textController.text.substring(0, textController.text.length - 2);
  }

  void _onPickerSelected(PickerType pickerType) {
    if (pickerType == PickerType.emoji) {
      focusNode.unfocus();

      setState(() => _pickerType = pickerType);
    }

    if (pickerType == PickerType.keyboard) {
      if (_pickerType == null) {
        focusNode.requestFocus();
      }

      setState(() => _pickerType = null);
    }

    if (pickerType == PickerType.file) {
      focusNode.unfocus();

      setState(() => _pickerType = pickerType);
    }
  }
}
