import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/bloc/messages_bloc.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';
import 'package:whatsapp_clone_flutter/core/sockets/chats_socket.dart';
import 'package:whatsapp_clone_flutter/cubit/status_chat_cubit.dart';
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
import '../pages/scanner_page.dart';

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
      case SCANNER_PAGE:
        return MaterialPageRoute(builder: (_) => const ScannerPage());
      case CONVERSATION_PAGE:
        final Chat chat = settings.arguments as Chat;

        final repo = ConversationRepository(http: getIt(), chat: chat);
        final socket = ChatsSocket(storage: getIt(), chat: chat);

        final bloc = MessagesBloc(repo, socket);
        final cubit = StatusChatCubit(socket);

        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (_) => repo,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => bloc),
                BlocProvider(create: (_) => cubit),
              ],
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
