import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_dto.freezed.dart';

@freezed
abstract class ProjectDTO with _$ProjectDTO {
  const factory ProjectDTO(
    int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _ProjectDTO;
}
