import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/app_config.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';

class AvatarImage extends StatelessWidget {
  final String path;
  const AvatarImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getIt<AuthStorage>().getToken(),
      builder: (context, snapshot) {
        final token = snapshot.data;

        return CircleAvatar(
          backgroundImage: token == null
              ? null
              : NetworkImage(
                  '${AppConfig.baseUrl}/images/$path',
                  headers: {'Authorization': token},
                ),
        );
      },
    );
  }
}
