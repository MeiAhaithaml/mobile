import 'dart:convert';
import 'package:app2/common/services/secure_storage_service.dart';
import 'package:http/http.dart' as http;

import '../api_connect/rest_api.dart';
import '../utils/keys.dart';

class AuthService {
  final SecureStorageService storageService = SecureStorageService();

  Future<Map<String, dynamic>> login(String userName, String password) async {
    try {
      String? tokenFirebase =
      await storageService.readSecureData(AppKeys.KEY_TOKEN_FIREBASE);

      Map<String, String> body = {
        "userName": userName,
        "password": password,
        "tokenFireBase": tokenFirebase ?? '',
      };


      var response = await http.post(
        Uri.parse('${PathConstant.BACKEND_URL}/${PathConstant.LOGIN_URL}'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(body),
      );


      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }


  Future<void> saveUserToken(String token) async {
    await storageService.writeSecureData(AppKeys.KEY_TOKEN, token);
  }


  Future<bool> userLoggedIn() async {
    return await storageService.containsKeyInSecureData(AppKeys.KEY_TOKEN);
  }
}
