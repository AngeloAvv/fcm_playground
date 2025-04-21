part of 'project_cubit.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = InitialProjectState;

  const factory ProjectState.getting() = GettingProjectState;

  const factory ProjectState.got(Project project) = GotProjectState;

  const factory ProjectState.none() = NoneProjectState;

  const factory ProjectState.errorGetting(LocalizedError error) =
      ErrorGettingProjectState;

  const factory ProjectState.fetching() = FetchingProjectState;

  const factory ProjectState.fetched(List<Project> projects) =
      FetchedProjectState;

  const factory ProjectState.empty() = EmptyProjectState;

  const factory ProjectState.errorFetching(LocalizedError error) =
      ErrorFetchingProjectState;
}
