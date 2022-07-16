import 'package:whatsapp_clone_flutter/core/network/client_http.dart';
import 'package:whatsapp_clone_flutter/models/contact_model.dart';

class ContactsRepository {
  final Http http;
  const ContactsRepository(this.http);

  Future<List<Contact>> getContacts() async {
    final data = await http.response<List<Contact>>(
      url: '/contacts',
      mapper: (json) {
        final data = json['data'] as List<dynamic>;

        return data.map((e) => Contact.fromJson(e)).toList();
      },
    );

    return data ?? [];
  }
}
