import 'package:dart_mapper/dart_mapper.dart';
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/services/dto/project/project_dto.dart';
import 'package:fcm_playground/services/dto/service_account_credentials_dto.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

part 'project_mapper.g.dart';

ClientId _toClientId(dynamic dto) {
  assert(dto is String);

  final clientId = dto as String;

  return ClientId(clientId);
}

@Mapper()
abstract class ProjectMapper {
  const ProjectMapper();

  ProjectDTO toDTO(Project project);

  ProjectsEntity toEntity(ProjectDTO dto);

  ProjectDTO fromEntity(ProjectsEntity entity);

  @Mapping(source: 'clientEmail', target: 'email')
  @Mapping(target: 'clientId', callable: _toClientId)
  ServiceAccountCredentialsDTO toServiceCredentialsDTO(Project project);

  Project toModel(ProjectDTO dto);

  List<Project> toModels(List<ProjectDTO> dtos) => dtos.map(toModel).toList();
}
