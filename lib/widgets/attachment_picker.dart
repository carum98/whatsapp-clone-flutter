import 'package:flutter/material.dart';

class AttachmentPicker extends StatelessWidget {
  const AttachmentPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            spacing: 25,
            children: [
              _CircleButton(
                icon: Icons.insert_drive_file,
                onPressed: () {},
                color: Colors.blue,
                text: 'File',
              ),
              _CircleButton(
                icon: Icons.camera_alt,
                onPressed: () {},
                color: Colors.red,
                text: 'Camera',
              ),
              _CircleButton(
                icon: Icons.image,
                onPressed: () {},
                color: Colors.purple,
                text: 'Gallery',
              ),
            ],
          ),
          const SizedBox(height: 25),
          Wrap(
            spacing: 25,
            children: [
              _CircleButton(
                icon: Icons.headphones,
                onPressed: () {},
                color: Colors.orange,
                text: 'Audio',
              ),
              _CircleButton(
                icon: Icons.location_on,
                onPressed: () {},
                color: Colors.green,
                text: 'Location',
              ),
              _CircleButton(
                icon: Icons.person,
                onPressed: () {},
                color: Colors.blue,
                text: 'Contact',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const _CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          constraints: const BoxConstraints(
            minWidth: 55,
            minHeight: 55,
          ),
          onPressed: onPressed,
          shape: const CircleBorder(),
          fillColor: color,
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
