import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ErrorEditingProjectDialog extends StatelessWidget {
  const ErrorEditingProjectDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogErrorEditingProjectTitle ??
          'dialogErrorEditingProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogErrorEditingProjectMessage ??
          'dialogErrorEditingProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
