import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/misc/resources.dart';
import 'package:flutter/material.dart';

class ImportProjectCard extends StatelessWidget {
  final GestureTapCallback? onTap;

  const ImportProjectCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFB8C00),
              Color(0xFFFFEB3B),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Card(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(R.firebaseImage, width: 96, height: 96),
                ),
                Text(
                  context.l10n?.actionImportProject ?? 'actionImportProject',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
