import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/blocs/file_picker/file_picker_bloc.dart';
import 'package:fcm_playground/blocs/project/project_bloc.dart' as bloc;
import 'package:fcm_playground/cubits/project/project_cubit.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/features/routing/app_router.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/pages/main/dialogs/error_importing_project_dialog.dart';
import 'package:fcm_playground/pages/main/dialogs/imported_project_dialog.dart';
import 'package:fcm_playground/pages/main/widgets/import_project_card.dart';
import 'package:fcm_playground/pages/main/widgets/project_card.dart';
import 'package:fcm_playground/widgets/buttons/settings_icon_button.dart';
import 'package:fcm_playground/widgets/loading_widget.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class MainPage extends StatelessWidget implements AutoRouteWrapper {
  const MainPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<FilePickerBloc>(
        create:
            (context) => FilePickerBloc(filePickerRepository: context.read()),
      ),
      BlocProvider<bloc.ProjectBloc>(
        create:
            (context) => bloc.ProjectBloc(projectRepository: context.read()),
      ),
      BlocProvider<ProjectCubit>(
        create:
            (context) =>
                ProjectCubit(projectRepository: context.read())..fetch(),
      ),
    ],
    child: this,
  );

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<FilePickerBloc, FilePickerState>(
        listener:
            (context, state) => switch (state) {
              PickedFilePickerState(paths: [final path, ...]) => _importProject(
                context,
                path,
              ),
              _ => null,
            },
      ),
      BlocListener<bloc.ProjectBloc, bloc.ProjectState>(
        listener:
            (context, state) => switch (state) {
              bloc.ImportedProjectState() => _onImported(context),
              bloc.ErrorImportingProjectState() => _onErrorImporting(context),
              _ => null,
            },
      ),
    ],
    child: Scaffold(
      appBar: AppBar(
        title: Text(context.l10n?.titleRecentProjects ?? 'titleRecentProjects'),
        actions: [
          SettingsIconButton(
            onPressed: () => context.pushRoute(SettingsRoute()),
          ),
        ],
      ),
      body: BlocBuilder<ProjectCubit, ProjectState>(
        builder:
            (context, state) => switch (state) {
              FetchingProjectState() => LoadingWidget(),
              FetchedProjectState(:final projects) => AlignedGridView.extent(
                maxCrossAxisExtent: 400.0,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 4.0,
                itemCount: projects.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ImportProjectCard(onTap: () => _pickFile(context));
                  }

                  final project = projects[index - 1];

                  return ProjectCard(
                    project,
                    onTap: () => _selectProject(context, project),
                  );
                },
              ),
              EmptyProjectState() => CourtesyWidget(
                title: context.l10n?.labelLetsBegin ?? 'labelLetsBegin',
                message:
                    context.l10n?.labelSelectProject ?? 'labelSelectProject',
                action:
                    context.l10n?.actionImportProject ?? 'actionImportProject',
                onPressed: () => _pickFile(context),
              ),
              ErrorFetchingProjectState() => CourtesyWidget(
                title:
                    context.l10n?.labelGenericErrorTitle ??
                    'labelGenericErrorTitle',
                message:
                    context.l10n?.labelErrorFetchingProjects ??
                    'labelErrorFetchingProjects',
              ),
              _ => const SizedBox.shrink(),
            },
      ),
    ),
  );

  void _importProject(BuildContext context, String path) {
    context.projectBloc.import(path);
  }

  void _onImported(BuildContext context) =>
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (_) => ImportedProjectDialog(),
        ),
      );

  void _onErrorImporting(BuildContext context) =>
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (_) => ErrorImportingProjectDialog(),
        ),
      );

  void _pickFile(BuildContext context) {
    context.filePickerBloc.pickFile(
      title:
          context.l10n?.dialogImportServiceAccount ??
          'dialogImportServiceAccount',
      allowedExtensions: ['json'],
    );
  }

  void _selectProject(BuildContext context, Project project) {
    context.pushRoute(ProjectRoute(id: project.id));
  }
}
