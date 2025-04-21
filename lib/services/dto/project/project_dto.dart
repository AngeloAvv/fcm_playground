import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine/pine.dart';

part 'project_dto.freezed.dart';

@freezed
abstract class ProjectDTO extends DTO with _$ProjectDTO {
  const ProjectDTO._();

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
