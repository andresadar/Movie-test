import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

///The service that handles the authentication.
class AuthService {
  ///Save the user in the local storage.
  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String userEncode = jsonEncode(user.toJson());

    await prefs.setString('user', userEncode);
  }

  ///Gets the user from the local storage.
  Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userEncode = prefs.getString('user');

    if (userEncode != null) {
      final Map<String, dynamic> userDecode = jsonDecode(userEncode);

      final UserModel user = UserModel.fromJson(userDecode);

      return user;
    }

    return null;
  }

  ///Signs out.
  Future<void> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('user');
  }
}

final authServiceProvider = Provider.autoDispose((ref) => AuthService());
