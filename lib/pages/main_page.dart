import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';
import 'package:whatsapp_clone_flutter/ui/chats/list_chats.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp Clone'),
          centerTitle: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
            indicatorWeight: 3,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
              onSelected: (value) {
                if (value == 'logout') {
                  context.read<AuthReposoitory>().logout();
                }
              },
            )
          ],
        ),
        body: const TabBarView(
          children: [
            ListChats(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, CONTACTS_PAGE),
          backgroundColor: const Color(0xFF09a784),
          child: const Icon(Icons.message, color: Colors.white),
        ),
      ),
    );
  }
}
