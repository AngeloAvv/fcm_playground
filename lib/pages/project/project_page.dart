import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/blocs/notification/notification_bloc.dart';
import 'package:fcm_playground/blocs/project/project_bloc.dart' as blocs;
import 'package:fcm_playground/cubits/project/project_cubit.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/features/routing/app_router.dart';
import 'package:fcm_playground/models/enums/notification_type.dart';
import 'package:fcm_playground/models/message/message.dart';
import 'package:fcm_playground/models/notification/notification.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/pages/project/dialogs/error_removing_project_dialog.dart';
import 'package:fcm_playground/pages/project/dialogs/error_sending_notification_dialog.dart';
import 'package:fcm_playground/pages/project/dialogs/remove_project_dialog.dart';
import 'package:fcm_playground/pages/project/dialogs/sent_notification_dialog.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_body_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_data_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_image_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_title_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_token_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_topic_field.dart';
import 'package:fcm_playground/pages/project/widgets/fields/notification_type_field.dart';
import 'package:fcm_playground/pages/project/widgets/send_button.dart';
import 'package:fcm_playground/widgets/buttons/delete_icon_button.dart';
import 'package:fcm_playground/widgets/buttons/edit_icon_button.dart';
import 'package:fcm_playground/widgets/loading_widget.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Enter the Project documentation here
@RoutePage()
class ProjectPage extends StatefulWidget implements AutoRouteWrapper {
  static const _kFormTitle = 'title';
  static const _kFormBody = 'body';
  static const _kFormImage = 'image';
  static const _kFormType = 'type';
  static const _kFormToken = 'token';
  static const _kFormTopic = 'topic';
  static const _kFormData = 'data';

  final int id;

  /// The constructor of the page.
  const ProjectPage(this.id, {super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<NotificationBloc>(
        create:
            (context) =>
                NotificationBloc(notificationRepository: context.read()),
      ),
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
  State<ProjectPage> createState() => _ProjectState();
}

class _ProjectState extends State<ProjectPage> {
  final _form = FormGroup({
    ProjectPage._kFormTitle: FormControl<String>(),
    ProjectPage._kFormBody: FormControl<String>(),
    ProjectPage._kFormImage: FormControl<String>(),
    ProjectPage._kFormType: FormControl<NotificationType>(
      validators: [Validators.required],
    ),
    ProjectPage._kFormToken: FormControl<String>(),
    ProjectPage._kFormTopic: FormControl<String>(),
    ProjectPage._kFormData: FormControl<Map<String, String>>(),
  });

  late final StreamSubscription _typeSubscription;

  @override
  void initState() {
    super.initState();

    _typeSubscription = _form
        .control(ProjectPage._kFormType)
        .valueChanges
        .listen(_onTypeChanged);
  }

  @override
  void dispose() {
    _typeSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<NotificationBloc, NotificationState>(
        listener:
            (context, state) => switch (state) {
              SendingNotificationState() => _onSending(),
              SentNotificationState() => _onSent(context),
              ErrorSendingNotificationState() => _onErrorSending(context),
              _ => null,
            },
      ),
      BlocListener<blocs.ProjectBloc, blocs.ProjectState>(
        listener:
            (context, state) => switch (state) {
              blocs.RemovedProjectState() => _onRemoved(context),
              blocs.ErrorRemovingProjectState() => _onErrorRemoving(context),
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
                actions: [
                  EditIconButton(
                    onPressed: () => _navigateToEditProject(context),
                  ),
                  DeleteIconButton(
                    onPressed: () => _showRemoveProjectDialog(context),
                  ),
                ],
              ),
              _ => null,
            },
            body: switch (state) {
              GettingProjectState() => const LoadingWidget(),
              GotProjectState(:final project) => ReactiveForm(
                formGroup: _form,
                child: ListView(
                  children: [
                    NotificationTitleField(
                      formControlName: ProjectPage._kFormTitle,
                    ),
                    NotificationBodyField(
                      formControlName: ProjectPage._kFormBody,
                    ),
                    NotificationImageField(
                      formControlName: ProjectPage._kFormImage,
                    ),
                    NotificationTypeField(
                      formControlName: ProjectPage._kFormType,
                    ),
                    ReactiveValueListenableBuilder<NotificationType>(
                      formControlName: ProjectPage._kFormType,
                      builder:
                          (context, control, _) => switch (control.value) {
                            NotificationType.token => NotificationTokenField(
                              formControlName: ProjectPage._kFormToken,
                            ),
                            NotificationType.topic => NotificationTopicField(
                              formControlName: ProjectPage._kFormTopic,
                            ),
                            _ => const SizedBox.shrink(),
                          },
                    ),
                    NotificationDataField(
                      formControlName: ProjectPage._kFormData,
                    ),
                    BlocSelector<NotificationBloc, NotificationState, bool>(
                      selector: (state) => state is SendingNotificationState,
                      builder:
                          (context, loading) => switch (loading) {
                            true => const LoadingWidget(),
                            false => SendButton(
                              onPressed:
                                  () => _sendNotification(context, project),
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

  void _sendNotification(BuildContext context, Project project) {
    final title = _form.control(ProjectPage._kFormTitle).value;
    final body = _form.control(ProjectPage._kFormBody).value;
    final image = _form.control(ProjectPage._kFormImage).value;
    final token = _form.control(ProjectPage._kFormToken).value;
    final topic = _form.control(ProjectPage._kFormTopic).value;
    final data = _form.control(ProjectPage._kFormData).value;

    context.notificationBloc.send(
      Message(
        notification: Notification(title: title, body: body, image: image),
        token: token,
        topic: topic,
        data: data,
      ),
      project: project,
    );
  }

  void _showRemoveProjectDialog(BuildContext context) => showDialog(
    context: context,
    builder:
        (_) => RemoveProjectDialog(
          onConfirm: () => context.projectBloc.remove(widget.id),
        ),
  );

  void _onRemoved(BuildContext context) {
    context.maybePop();
  }

  void _onErrorRemoving(BuildContext context) =>
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (_) => ErrorRemovingProjectDialog(),
        ),
      );

  void _navigateToEditProject(BuildContext context) {
    context.pushRoute(EditProjectRoute(id: widget.id));
  }

  void _onSending() {
    _form.markAsDisabled();
  }

  void _onSent(BuildContext context) {
    _form.markAsEnabled();
    _form.reset();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (_) => SentNotificationDialog(),
      ),
    );
  }

  void _onErrorSending(BuildContext context) {
    _form.markAsEnabled();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showAdaptiveDialog(
        context: context,
        builder: (context) => ErrorSendingNotificationDialog(),
      ),
    );
  }

  void _onTypeChanged(event) {
    _form.patchValue({
      ProjectPage._kFormToken: null,
      ProjectPage._kFormTopic: null,
    });
  }
}
