import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

enum NotificationType { token, topic }

extension NotificationTypeLocalizations on NotificationType {
  String localizedString(BuildContext context) => switch (this) {
    NotificationType.token => context.l10n?.labelToken ?? 'labelToken',
    NotificationType.topic => context.l10n?.labelTopic ?? 'labelTopic',
  };
}
