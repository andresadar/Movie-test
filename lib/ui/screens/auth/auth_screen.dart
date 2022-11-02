import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/ui/screens/auth/auth_states.dart';
import 'package:leal_flutter/ui/screens/home/home_screen.dart';
import 'package:leal_flutter/ui/screens/login/login_screen.dart';
import 'package:leal_flutter/ui/views/error.dart';
import 'package:leal_flutter/ui/views/loading.dart';
import 'package:leal_flutter/ui/widgets/dialogs/dialogs.dart';

import 'auth_controller.dart';

///?The screen to be displayed according to the state of the authentication screen.
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Alerts and dialogs are displayed according to the state of the authentication screen.
    ref.listen(authControllerProvider, (previous, next) {
      ///If the state is an error state.
      if (next is AuthErrorState) {
        AppDialogs.errorDialog(context, message: next.message);
      }

      ///If the state is a loggin state with message the welcome dialog is displayed.
      // if (next is AuthLoggedInState) {
      //   AppDialogs.successDialog(context,
      //       message: 'Welcome ${next.user.email}');
      // }
    });

    return Consumer(builder: ((context, ref, child) {
      ///This reference is the same as the reference in the compile method,
      ///to render the view inside the consumer widget with the watch method.
      final state = ref.watch(authControllerProvider);

      ///The loading screen.
      if (state is AuthLoadingState) {
        return const LoadingView();
      }

      ///The error screen.
      if (state is AuthErrorState) {
        return ErrorView(message: state.message);
      }

      ///The authenticated screen.
      if (state is AuthLoggedInState) {
        return const HomeScreen();
      }

      ///The login screen.
      return const LoginScreen();
    }));
  }
}
