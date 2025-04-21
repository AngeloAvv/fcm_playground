import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class EditedProjectDialog extends StatelessWidget {
  const EditedProjectDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogEditedProjectTitle ?? 'dialogEditedProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogEditedProjectMessage ??
          'dialogEditedProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
