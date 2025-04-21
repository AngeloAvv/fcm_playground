import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/misc/resources.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final GestureTapCallback? onTap;

  const ProjectCard(this.project, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.hardEdge,
    margin: EdgeInsets.zero,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Image.asset(R.firebaseImage, width: 96, height: 96),
            ),
            Text(
              project.name ?? project.projectId,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              context.l10n?.labelCreatedOn(project.createdAt) ?? 'labelCreatedOn(${project.createdAt})',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    ),
  );
}
