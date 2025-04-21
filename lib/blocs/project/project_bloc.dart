import 'dart:async';

import 'package:fcm_playground/errors/generic_error.dart';
import 'package:fcm_playground/repositories/project_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_bloc.freezed.dart';
part 'project_event.dart';
part 'project_state.dart';

/// The ProjectBloc
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepository projectRepository;

  /// Create a new instance of [ProjectBloc].
  ProjectBloc({required this.projectRepository})
    : super(const ProjectState.initial()) {
    on<EditProjectEvent>(_onEdit);
    on<ImportProjectEvent>(_onImport);
    on<RemoveProjectEvent>(_onRemove);
  }

  /// Method used to add the [EditProjectEvent] event
  void edit(
    int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  }) =>
      add(ProjectEvent.edit(
        id,
        name: name,
        projectId: projectId,
        clientId: clientId,
        privateKey: privateKey,
        clientEmail: clientEmail,
      ));

  /// Method used to add the [ImportProjectEvent] event
  void import(String path) => add(ProjectEvent.import(path));

  /// Method used to add the [RemoveProjectEvent] event
  void remove(int id) => add(ProjectEvent.remove(id));

  FutureOr<void> _onEdit(
    EditProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.editing());

    try {
      await projectRepository.edit(
        event.id,
        name: event.name,
        projectId: event.projectId,
        clientId: event.clientId,
        privateKey: event.privateKey,
        clientEmail: event.clientEmail,
      );

      emit(const ProjectState.edited());
    } on LocalizedError catch (error) {
      emit(ProjectState.errorEditing(error));
    } catch (_) {
      emit(ProjectState.errorEditing(GenericError()));
    }
  }

  FutureOr<void> _onImport(
    ImportProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.importing());

    try {
      await projectRepository.import(event.path);

      emit(const ProjectState.imported());
    } on LocalizedError catch (error) {
      emit(ProjectState.errorImporting(error));
    } catch (_) {
      emit(ProjectState.errorImporting(GenericError()));
    }
  }

  FutureOr<void> _onRemove(
    RemoveProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const ProjectState.removing());

    try {
      await projectRepository.remove(event.id);

      emit(const ProjectState.removed());
    } on LocalizedError catch (error) {
      emit(ProjectState.errorRemoving(error));
    } catch (_) {
      emit(ProjectState.errorRemoving(GenericError()));
    }
  }
}

extension ProjectBlocExtension on BuildContext {
  /// Extension method used to get the [ProjectBloc] instance
  ProjectBloc get projectBloc => read<ProjectBloc>();

  /// Extension method used to watch the [ProjectBloc] instance
  ProjectBloc get watchProjectBloc => watch<ProjectBloc>();
}
