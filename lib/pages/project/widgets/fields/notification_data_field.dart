import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/widgets/reactive/fcm_reactive_json_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NotificationDataField extends StatelessWidget {
  final String formControlName;

  const NotificationDataField({required this.formControlName, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: FcmReactiveJsonField(
      label: context.l10n?.labelNotificationData ?? 'labelNotificationData',
      formControlName: formControlName,
      decoration: InputDecoration(hintText: context.l10n?.hintNotificationData),
      maxLines: 10,
      validationMessages: ReactiveFormConfig.of(context)?.validationMessages,
      style: Theme.of(context).textTheme.bodyLarge,
      showErrors: (_) => true,
    ),
  );
}
