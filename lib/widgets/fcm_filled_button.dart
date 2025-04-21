import 'package:flutter/material.dart';

class FcmFilledButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;

  const FcmFilledButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FilledButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      );
}
