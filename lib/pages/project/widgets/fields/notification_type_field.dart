import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/models/enums/notification_type.dart';
import 'package:fcm_playground/widgets/reactive/fcm_reactive_dropdown_field.dart';
import 'package:flutter/material.dart';

class NotificationTypeField extends StatelessWidget {
  final String formControlName;

  const NotificationTypeField({required this.formControlName, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: FcmReactiveDropdownField<NotificationType>(
      NotificationType.values
          .map(
            (type) => DropdownMenuItem<NotificationType>(
              key: ValueKey(type),
              value: type,
              child: Text(
                type.localizedString(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(growable: false),
      label: context.l10n?.labelNotificationType ?? 'labelNotificationType',
      formControlName: formControlName,
    ),
  );
}
