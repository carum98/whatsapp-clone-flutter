import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/bloc/messages_bloc.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';
import 'package:whatsapp_clone_flutter/core/sockets/chats_socket.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/repository/contacts_repository.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

import '../pages/contacts_page.dart';
import '../pages/conversation_page.dart';
import '../pages/landing_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/register_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case LANDING_PAGE:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case REGISTER_PAGE:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case CONVERSATION_PAGE:
        final Chat chat = settings.arguments as Chat;

        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => ConversationRepository(http: getIt(), chat: chat),
            child: BlocProvider(
              create: (context) => MessagesBloc(
                context.read<ConversationRepository>(),
                ChatsSocket(storage: getIt(), chat: chat),
              ),
              child: const ConversationPage(),
            ),
          ),
        );

      case CONTACTS_PAGE:
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => ContactsRepository(getIt()),
            child: const ContactsPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route')),
          ),
        );
    }
  }
}
