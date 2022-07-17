import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final storage = const FlutterSecureStorage();
  String? _tokenCache;

  get tokenCache => _tokenCache;

  Future<String?> getToken() async {
    final token = await storage.read(key: 'token');
    _tokenCache = token;
    return token;
  }

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
