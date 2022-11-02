import 'package:flutter/material.dart';

///This class contains the methods to display the dialogs.
abstract class AppDialogs {
  ///Success dialog.
  static Future<void> successDialog(BuildContext context,
          {required String message}) async =>
      await showDialog(
          context: context,
          builder: (context) => _SuccessDialog(message: message));

  ///Error dialog
  static Future<void> errorDialog(BuildContext context,
          {required String message}) async =>
      await showDialog(
          context: context,
          builder: (context) => _ErrorDialog(message: message));
}

///Success dialog.
class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Éxito'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

///Error dialog
class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Algo salió mal'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
