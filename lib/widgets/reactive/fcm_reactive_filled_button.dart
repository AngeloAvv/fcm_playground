import 'package:fcm_playground/widgets/fcm_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveFilledButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;

  const FcmReactiveFilledButton({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ReactiveFormConsumer(
    builder:
        (context, formGroup, child) => FcmFilledButton(
          onPressed: formGroup.valid ? () => onPressed?.call() : null,
          text: text,
        ),
  );
}
