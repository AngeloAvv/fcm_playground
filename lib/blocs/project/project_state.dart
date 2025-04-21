part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = InitialProjectState;

  const factory ProjectState.editing() = EditingProjectState;

  const factory ProjectState.edited() = EditedProjectState;

  const factory ProjectState.errorEditing(LocalizedError error) =
      ErrorEditingProjectState;

  const factory ProjectState.importing() = ImportingProjectState;

  const factory ProjectState.imported() = ImportedProjectState;

  const factory ProjectState.errorImporting(LocalizedError error) =
      ErrorImportingProjectState;

  const factory ProjectState.removing() = RemovingProjectState;

  const factory ProjectState.removed() = RemovedProjectState;

  const factory ProjectState.errorRemoving(LocalizedError error) =
      ErrorRemovingProjectState;
}
