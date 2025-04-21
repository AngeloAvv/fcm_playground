import 'dart:async';

import 'package:fcm_playground/errors/generic_error.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/repositories/project_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_cubit.freezed.dart';
part 'project_state.dart';

/// The ProjectCubit
class ProjectCubit extends Cubit<ProjectState> {
  final ProjectRepository projectRepository;

  StreamSubscription<Project?>? _projectSubscription;
  StreamSubscription<List<Project>>? _projectsSubscription;

  /// Create a new instance of [ProjectCubit].
  ProjectCubit({required this.projectRepository})
    : super(const ProjectState.initial());

  /// Method used to perform the [get] action
  FutureOr<void> get(int id) {
    emit(const ProjectState.getting());

    _projectSubscription?.cancel();
    _projectSubscription = projectRepository
        .project(id)
        .listen(
          (project) {
            if (project != null) {
              emit(ProjectState.got(project));
            } else {
              emit(const ProjectState.none());
            }
          },
          onError: (error) {
            if (error is LocalizedError) {
              emit(ProjectState.errorGetting(error));
            } else {
              emit(ProjectState.errorGetting(GenericError()));
            }
          },
        );
  }

  /// Method used to perform the [fetch] action
  FutureOr<void> fetch() async {
    emit(const ProjectState.fetching());

    _projectsSubscription?.cancel();
    _projectsSubscription = projectRepository.projects().listen(
      (projects) {
        if (projects.isNotEmpty) {
          emit(ProjectState.fetched(projects));
        } else {
          emit(const ProjectState.empty());
        }
      },
      onError: (error) {
        if (error is LocalizedError) {
          emit(ProjectState.errorFetching(error));
        } else {
          emit(ProjectState.errorFetching(GenericError()));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _projectSubscription?.cancel();
    _projectsSubscription?.cancel();

    return super.close();
  }
}

extension ProjectCubitExtension on BuildContext {
  /// Extension method used to get the [ProjectCubit] instance
  ProjectCubit get projectCubit => read<ProjectCubit>();

  /// Extension method used to watch the [] instance
  ProjectCubit get watchProjectCubit => watch<ProjectCubit>();
}
