import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/ui/screens/auth/auth_states.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';
import 'auth_controller.dart';

///?The screen to be displayed according to the state of the authentication screen.
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    ///The loading screen.
    if (state is AuthLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    ///The error screen.
    if (state is AuthErrorState) {
      return Center(child: Text(state.message));
    }

    ///The logged in screen.
    if (state is AuthLoggedInState) {
      return const HomeScreen();
    }

    return const LoginScreen();
  }
}
