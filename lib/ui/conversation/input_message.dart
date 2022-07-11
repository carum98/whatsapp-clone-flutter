import 'package:flutter/material.dart';

class InputMessage extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSend;
  const InputMessage({Key? key, required this.textController, required this.onSend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onPressed: onSend,
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
