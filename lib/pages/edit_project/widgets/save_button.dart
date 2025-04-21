import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/widgets/reactive/fcm_reactive_filled_button.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final GestureTapCallback? onPressed;

  const SaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
    child: FcmReactiveFilledButton(
      onPressed: onPressed,
      text: context.l10n?.actionSave ?? 'actionSave',
    ),
  );
}
