import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ErrorImportingProjectDialog extends StatelessWidget {
  const ErrorImportingProjectDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogErrorImportingProjectTitle ??
          'dialogErrorImportingProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogErrorImportingProjectMessage ??
          'dialogErrorImportingProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
