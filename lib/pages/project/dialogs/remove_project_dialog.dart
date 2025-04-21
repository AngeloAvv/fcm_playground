import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

class RemoveProjectDialog extends StatelessWidget {
  final VoidCallback? onConfirm;
  
  const RemoveProjectDialog({super.key, this.onConfirm});

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      context.l10n?.dialogRemoveProjectTitle ?? 'dialogRemoveProjectTitle',
    ),
    content: Text(
      context.l10n?.dialogRemoveProjectMessage ??
          'dialogRemoveProjectMessage',
    ),
    actions: [
      TextButton(
        onPressed: () => context.maybePop().then((_) => onConfirm?.call()),
        child: Text(context.l10n?.actionYes ?? 'actionYes'),
      ),
      TextButton(
        onPressed: () => context.maybePop(),
        child: Text(context.l10n?.actionNo ?? 'actionNo'),
      ),
    ],
  );
}
