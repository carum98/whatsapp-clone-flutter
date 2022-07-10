import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/bloc/messages_bloc.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';
import 'package:whatsapp_clone_flutter/models/chats_model.dart';
import 'package:whatsapp_clone_flutter/repository/conversation_repository.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

import '../pages/conversation_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case CONVERSATION_PAGE:
        final Chat chat = settings.arguments as Chat;

        final repo = ConversationRepository(
          http: getIt(),
          chat: chat,
        );

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MessagesBloc(repo),
            child: const ConversationPage(),
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
