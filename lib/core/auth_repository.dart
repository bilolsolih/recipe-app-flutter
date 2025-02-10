import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';

class AuthRepository {
  AuthRepository({
    required this.client,
  });

  final ApiClient client;

  Future<bool> login(String login, String password) async {
    var rawData = await client.login(login, password);
    var token = rawData['accessToken'];
    if (token != null) {
      await SecureStorage.deleteCredentials();
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token);
      print(token);
      return true;
    }

    return false;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }
}
