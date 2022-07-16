import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/models/contact_model.dart';
import 'package:whatsapp_clone_flutter/repository/contacts_repository.dart';
import 'package:whatsapp_clone_flutter/ui/contacts/tile_contact.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openChat(Contact contact) {
      context.read<ContactsRepository>().getChat(contact).then(
          (chat) => Navigator.pushReplacementNamed(context, '/conversation', arguments: chat));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Contact>>(
        future: context.read<ContactsRepository>().getContacts(),
        builder: (_, snapshot) {
          final contacts = snapshot.data;

          return ListView.builder(
            itemCount: contacts?.length ?? 0,
            itemBuilder: (_, index) {
              final contact = contacts![index];

              return TileContact(
                contact: contact,
                onTap: () => openChat(contact),
              );
            },
          );
        },
      ),
    );
  }
}
