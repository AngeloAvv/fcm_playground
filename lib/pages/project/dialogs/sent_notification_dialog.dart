import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class SentNotificationDialog extends StatelessWidget {
  const SentNotificationDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogSentNotificationTitle ?? 'dialogSentNotificationTitle',
    ),
    content: Text(
      context.l10n?.dialogSentNotificationMessage ??
          'dialogSentNotificationMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
