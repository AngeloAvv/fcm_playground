part of 'project_bloc.dart';

@freezed
sealed class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.edit(
    int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  }) = EditProjectEvent;

  const factory ProjectEvent.import(String path) = ImportProjectEvent;

  const factory ProjectEvent.remove(int id) = RemoveProjectEvent;
}
