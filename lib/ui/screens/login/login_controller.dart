import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/data/models/user_model.dart';
import 'package:leal_flutter/ui/screens/auth/auth_controller.dart';

import '../../../domain/repositories/local/auth_repository.dart';
import '../auth/auth_states.dart';
import 'login_states.dart';

class LoginController extends StateNotifier<LoginStates> {
  LoginController(this._authRepository, this._authController)
      : super(LoginInitialStates());

  ///The repository of the authentication screen.
  final AuthRepository _authRepository;
  final AuthController _authController;

  ///change the state
  void changeState(LoginStates state) => this.state = state;

  ///?Get state
  LoginStates get getState => state;

  ///Sign in with email and password.
  ///[email] and [password] is valid when is maria and password || pedro and 123456
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    ///Verify if the email and password are valid.
    if (email != "maria" &&
        password != "password" &&
        email != "pedro" &&
        password != "123456") {
      changeState(LoginErrorState(message: "Email and password invalid."));
      return;
    }

    try {
      ///change the state of the login screen to loading.
      state = LoginLoadingState();

      final user = UserModel(email: email, likes: []);

      ///sign in with email and password.
      await _authRepository.saveUser(user);

      //change the state of the authentication screen to logged in.
      _authController.changeState(AuthLoggedInState(user: user));
    } catch (e) {
      ///Error to sign in with email and password.
      state = LoginErrorState(message: e.toString());
    }
  }

  @override
  void dispose() {
    log("LoginController dispose");
    super.dispose();
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginStates>(
  (ref) => LoginController(
    ref.read(authRepositoryProvider),
    ref.read(authControllerProvider.notifier),
  ),
);
