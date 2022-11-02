import 'package:flutter/material.dart';
import 'package:leal_flutter/ui/theme/colors.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    super.key,
    required this.text,
    this.bgColor = UIColors.primaryColor,
    this.textColor = UIColors.backgroundColor,
    this.onPressed,
    this.isLoading = false,
  });

  final Color bgColor, textColor;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(140, 50),
        backgroundColor: bgColor,
        shape: const StadiumBorder(),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: textColor)),
    );
  }
}
