import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/models/contact_model.dart';
import 'package:whatsapp_clone_flutter/widgets/avatar_image.dart';

class TileContact extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;
  const TileContact({Key? key, required this.contact, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarImage(path: contact.avatar),
      title: Text(contact.name),
      subtitle: Text(contact.number),
      onTap: onTap,
    );
  }
}
