import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ErrorSendingNotificationDialog extends StatelessWidget {
  const ErrorSendingNotificationDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogErrorSendingNotificationTitle ??
          'dialogErrorSendingNotificationTitle',
    ),
    content: Text(
      context.l10n?.dialogErrorSendingNotificationMessage ??
          'dialogErrorSendingNotificationMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
