import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ImportedProjectDialog extends StatelessWidget {
  const ImportedProjectDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogImportedProjectTitle ?? 'dialogImportedProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogImportedProjectMessage ??
          'dialogImportedProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
