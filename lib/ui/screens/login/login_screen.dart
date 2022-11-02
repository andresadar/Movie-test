import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leal_flutter/ui/screens/login/login_controller.dart';
import 'package:leal_flutter/ui/views/dialogs/error.dart';
import 'package:leal_flutter/ui/widgets/buttons/General_button.dart';
import 'package:leal_flutter/ui/widgets/inputs/general_input.dart';

import '../../theme/colors.dart';
import '../../widgets/inputs/password_input.dart';
import 'login_states.dart';

///Widgets
part 'widgets/form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///?Listen to the state of the login screen for dialog and alert.
    ref.listen(loginControllerProvider, (previous, next) {
      ///If the state is an error state.
      if (next is LoginErrorState) {
        uiErrorDialog(context, next.message);
      }
    });

    return const Scaffold(
      body: _Form(),
    );
  }
}
