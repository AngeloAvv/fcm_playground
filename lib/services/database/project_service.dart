import 'package:drift/drift.dart';
import 'package:fcm_playground/features/database/dao/project/project_dao.dart';
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart';
import 'package:fcm_playground/misc/mappers/project/project_mapper.dart';
import 'package:fcm_playground/services/dto/project/project_dto.dart';
import 'package:fcm_playground/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// Abstract class of ProjectService
abstract class ProjectService {
  Future<void> edit(int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  });

  Future<void> save({
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  });

  Future<List<ProjectDTO>> fetch();

  Stream<List<ProjectDTO>> realtimeFetch();

  Future<ProjectDTO?> get(int id);

  Stream<ProjectDTO?> realtimeGet(int id);

  Future<void> remove(int id);
}

/// Implementation of the base interface ProjectService
class ProjectServiceImpl extends Service implements ProjectService {
  final ProjectDAO projectDAO;
  final ProjectMapper projectMapper;

  const ProjectServiceImpl({
    required super.logger,
    required this.projectDAO,
    required this.projectMapper,
  });

  @override
  Future<void> edit(int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  }) async {
    try {
      logger.debug(
        '[$ProjectService] Editing project: {'
            'id: $id, '
            'name: $name, '
            'projectId: $projectId, '
            'clientId: $clientId, '
            'privateKey: $privateKey, '
            'clientEmail: $clientEmail, '
            '}',
      );

      final companion = ProjectsTableCompanion.insert(
        name: Value(name),
        projectId: projectId,
        clientId: clientId,
        privateKey: privateKey,
        clientEmail: clientEmail,
      );
      await projectDAO.edit(id, companion);

      logger.info('[$ProjectService] Project edited!');
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectService] Error editing project!',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> save({
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  }) async {
    try {
      logger.debug(
        '[$ProjectService] Saving project: {'
        'name: $name, '
        'projectId: $projectId, '
        'clientId: $clientId, '
        'privateKey: $privateKey, '
        'clientEmail: $clientEmail, '
        '}',
      );

      final companion = ProjectsTableCompanion.insert(
        name: Value(name),
        projectId: projectId,
        clientId: clientId,
        privateKey: privateKey,
        clientEmail: clientEmail,
      );
      await projectDAO.save(companion);

      logger.info('[$ProjectService] Project saved!');
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectService] Error saving project!',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<List<ProjectDTO>> fetch() async {
    try {
      logger.debug('[$ProjectService] Fetching projects');

      final projects = await projectDAO.fetch();

      logger.info('[$ProjectService] Projects fetched!');
      return projects.map(projectMapper.fromEntity).toList();
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectService] Error fetching projects!',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Stream<List<ProjectDTO>> realtimeFetch() => projectDAO
      .realtimeFetch()
      .map((projects) => projects.map(projectMapper.fromEntity).toList())
      .doOnData(
        (projects) =>
            logger.debug('[$ProjectService] Fetched projects: $projects'),
      )
      .doOnError((error, stackTrace) {
        logger.error(
          '[$ProjectService] Error fetching projects!',
          error,
          stackTrace,
        );
      });

  @override
  Future<ProjectDTO?> get(int id) async {
    try {
      logger.debug('[$ProjectService] Getting project with id: $id');

      final project = await projectDAO.get(id);

      logger.info('[$ProjectService] Project retrieved!');
      return project?.let(projectMapper.fromEntity);
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectService] Error getting project!',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<void> remove(int id) async {
    logger.debug('[$ProjectService] Removing project with id: $id');

    await projectDAO.remove(id);

    logger.info('[$ProjectService] Project removed!');
  }

  @override
  Stream<ProjectDTO?> realtimeGet(int id) => projectDAO
      .realtimeGet(id)
      .map((project) => project?.let(projectMapper.fromEntity))
      .doOnData(
        (project) =>
            logger.debug('[$ProjectService] Got project with id $id: $project'),
      )
      .doOnError((error, stackTrace) {
        logger.error(
          '[$ProjectService] Error getting project with id $id!',
          error,
          stackTrace,
        );
      });
}

extension ProjectServiceExtension on BuildContext {
  /// Extension method used to get the [$ProjectService] instance
  ProjectService get projectService => read<ProjectService>();
}
