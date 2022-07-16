import 'package:flutter/material.dart';

enum PickerType { emoji, file, keyboard }

class InputMessage extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function(PickerType) onPickerSelected;
  final VoidCallback onSend;

  const InputMessage({
    Key? key,
    required this.textController,
    required this.focusNode,
    required this.onPickerSelected,
    required this.onSend,
  }) : super(key: key);

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
                _IconToggle(
                  icon1: Icons.sentiment_very_satisfied_rounded,
                  icon2: Icons.keyboard,
                  onToggle: (value) {
                    onPickerSelected(value ? PickerType.keyboard : PickerType.emoji);
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                    ),
                  ),
                ),
                _IconToggle(
                  icon1: Icons.attach_file_rounded,
                  icon2: Icons.keyboard,
                  onToggle: (value) {
                    onPickerSelected(value ? PickerType.keyboard : PickerType.file);
                  },
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

class _IconToggle extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final Function(bool) onToggle;
  const _IconToggle({Key? key, required this.icon1, required this.icon2, required this.onToggle})
      : super(key: key);

  @override
  State<_IconToggle> createState() => __IconToggleState();
}

class __IconToggleState extends State<_IconToggle> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => _isSelected = !_isSelected);
        widget.onToggle(_isSelected);
      },
      icon: Icon(_isSelected ? widget.icon1 : widget.icon2, size: 18),
      visualDensity: VisualDensity.compact,
    );
  }
}
