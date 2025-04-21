import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class ErrorRemovingProjectDialog extends StatelessWidget {
  const ErrorRemovingProjectDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogErrorRemovingProjectTitle ??
          'dialogErrorRemovingProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogErrorRemovingProjectMessage ??
          'dialogErrorRemovingProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionOk ?? 'actionOk'),
      ),
    ],
  );
}
