import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/pages/edit_project/dialogs/edited_project_dialog.dart';
import 'package:fcm_playground/pages/edit_project/dialogs/error_editing_project_dialog.dart';
import 'package:fcm_playground/pages/edit_project/widgets/fields/project_client_email_field.dart';
import 'package:fcm_playground/pages/edit_project/widgets/fields/project_client_id_field.dart';
import 'package:fcm_playground/pages/edit_project/widgets/fields/project_id_field.dart';
import 'package:fcm_playground/pages/edit_project/widgets/fields/project_name_field.dart';
import 'package:fcm_playground/pages/edit_project/widgets/fields/project_private_key_field.dart';
import 'package:fcm_playground/pages/edit_project/widgets/save_button.dart';
import 'package:fcm_playground/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/blocs/project/project_bloc.dart' as blocs;
import 'package:fcm_playground/cubits/project/project_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Enter the EditProject documentation here
@RoutePage()
class EditProjectPage extends StatefulWidget implements AutoRouteWrapper {
  static const _kFormName = 'name';
  static const _kFormProjectId = 'projectId';
  static const _kFormClientId = 'clientId';
  static const _kFormPrivateKey = 'privateKey';
  static const _kFormClientEmail = 'clientEmail';

  final int id;

  /// The constructor of the page.
  const EditProjectPage(this.id, {super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<blocs.ProjectBloc>(
        create:
            (context) => blocs.ProjectBloc(projectRepository: context.read()),
      ),
      BlocProvider<ProjectCubit>(
        create:
            (context) =>
                ProjectCubit(projectRepository: context.read())..get(id),
      ),
    ],
    child: this,
  );

  @override
  State<EditProjectPage> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProjectPage> {
  final _form = FormGroup({
    EditProjectPage._kFormName: FormControl<String>(),
    EditProjectPage._kFormProjectId: FormControl<String>(
      validators: [Validators.required],
    ),
    EditProjectPage._kFormClientId: FormControl<String>(
      validators: [Validators.required],
    ),
    EditProjectPage._kFormPrivateKey: FormControl<String>(
      validators: [Validators.required],
    ),
    EditProjectPage._kFormClientEmail: FormControl<String>(
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<blocs.ProjectBloc, blocs.ProjectState>(
        listener:
            (context, state) => switch (state) {
              blocs.EditingProjectState() => _onEditing(),
              blocs.EditedProjectState() => _onEdited(context),
              blocs.ErrorEditingProjectState() => _onErrorEditing(context),
              _ => null,
            },
      ),
      BlocListener<ProjectCubit, ProjectState>(
        listener:
            (context, state) => switch (state) {
              GotProjectState(:final project) => _onGot(context, project),
              _ => null,
            },
      ),
    ],
    child: BlocBuilder<ProjectCubit, ProjectState>(
      builder:
          (context, state) => Scaffold(
            appBar: switch (state) {
              GotProjectState(:final project) => AppBar(
                title: Text(project.name ?? project.projectId),
              ),
              _ => null,
            },
            body: switch (state) {
              GettingProjectState() => const LoadingWidget(),
              GotProjectState(:final project) => ReactiveForm(
                formGroup: _form,
                child: ListView(
                  children: [
                    ProjectNameField(
                      formControlName: EditProjectPage._kFormName,
                    ),
                    ProjectIdField(
                      formControlName: EditProjectPage._kFormProjectId,
                    ),
                    ProjectClientIdField(
                      formControlName: EditProjectPage._kFormClientId,
                    ),
                    ProjectPrivateKeyField(
                      formControlName: EditProjectPage._kFormPrivateKey,
                    ),
                    ProjectClientEmailField(
                      formControlName: EditProjectPage._kFormClientEmail,
                    ),
                    BlocSelector<blocs.ProjectBloc, blocs.ProjectState, bool>(
                      selector: (state) => state is blocs.EditingProjectState,
                      builder:
                          (context, loading) => switch (loading) {
                            true => const LoadingWidget(),
                            false => SaveButton(
                              onPressed: () => _saveProject(context, project),
                            ),
                          },
                    ),
                  ],
                ),
              ),
              NoneProjectState() ||
              ErrorGettingProjectState() => CourtesyWidget(
                title:
                    context.l10n?.labelGenericErrorTitle ??
                    'labelGenericErrorTitle',
                message:
                    context.l10n?.labelErrorGettingProject ??
                    'labelErrorGettingProject',
              ),
              _ => const SizedBox.shrink(),
            },
          ),
    ),
  );

  void _saveProject(BuildContext context, Project project) {
    final name = _form.control(EditProjectPage._kFormName).value;
    final projectId = _form.control(EditProjectPage._kFormProjectId).value;
    final clientId = _form.control(EditProjectPage._kFormClientId).value;
    final privateKey = _form.control(EditProjectPage._kFormPrivateKey).value;
    final clientEmail = _form.control(EditProjectPage._kFormClientEmail).value;

    context.projectBloc.edit(
      widget.id,
      name: name,
      projectId: projectId,
      clientId: clientId,
      privateKey: privateKey,
      clientEmail: clientEmail,
    );
  }

  void _onGot(BuildContext context, Project project) {
    _form.patchValue({
      EditProjectPage._kFormName: project.name,
      EditProjectPage._kFormProjectId: project.projectId,
      EditProjectPage._kFormClientId: project.clientId,
      EditProjectPage._kFormPrivateKey: project.privateKey,
      EditProjectPage._kFormClientEmail: project.clientEmail,
    });
  }

  void _onEditing() {
    _form.markAsDisabled();
  }

  void _onEdited(BuildContext context) {
    _form.markAsEnabled();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
          showDialog(context: context, builder: (_) => EditedProjectDialog()),
    );
  }

  void _onErrorEditing(BuildContext context) {
    _form.markAsEnabled();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (_) => ErrorEditingProjectDialog(),
      ),
    );
  }
}
