import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/widgets/reactive/fcm_reactive_text_field.dart';
import 'package:flutter/material.dart';

class NotificationImageField extends StatelessWidget {
  final String formControlName;

  const NotificationImageField({required this.formControlName, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: FcmReactiveTextField(
      label: context.l10n?.labelNotificationImage ?? 'labelNotificationImage',
      formControlName: formControlName,
      decoration: InputDecoration(
        hintText: context.l10n?.hintNotificationImage,
      ),
      textCapitalization: TextCapitalization.sentences,
    ),
  );
}
