import 'package:fcm_playground/misc/mappers/project/project_mapper.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/repositories/repository.dart';
import 'package:fcm_playground/services/database/project_service.dart'
    as database;
import 'package:fcm_playground/services/local/project_service.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:rxdart/rxdart.dart';

/// Abstract class of ProjectRepository
abstract interface class ProjectRepository {
  Future<void> edit(
    int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  });

  Future<void> import(String path);

  Stream<Project?> project(int id);

  Stream<List<Project>> projects();

  Future<void> remove(int id);
}

/// Implementation of the base interface ProjectRepository
class ProjectRepositoryImpl extends Repository implements ProjectRepository {
  final database.ProjectService dbProjectService;
  final ProjectService projectService;
  final ProjectMapper projectMapper;

  const ProjectRepositoryImpl({
    required this.dbProjectService,
    required this.projectService,
    required this.projectMapper,
    required super.logger,
  });

  @override
  Future<void> edit(
    int id, {
    String? name,
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
  }) => safeCode(() async {
    try {
      logger.debug('[$ProjectRepository] Editing project with id: $id');

      await dbProjectService.edit(
        id,
        name: name,
        projectId: projectId,
        clientId: clientId,
        privateKey: privateKey,
        clientEmail: clientEmail,
      );
      logger.info('[$ProjectRepository] Project edited successfully!');
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectRepository] Error editing project with id: $id',
        error,
        stackTrace,
      );

      rethrow;
    }
  });

  @override
  Future<void> import(String path) => safeCode(() async {
    try {
      logger.debug('[$ProjectRepository] Importing project from path: $path');
      final project = await projectService.parse(path);
      logger.debug('[$ProjectRepository] Project data: $project');

      logger.debug('[$ProjectRepository] Saving project to database');
      await dbProjectService.save(
        name: project.projectId,
        projectId: project.projectId,
        clientId: project.clientId.identifier,
        privateKey: project.privateKey,
        clientEmail: project.email,
      );
      logger.info('[$ProjectRepository] Project imported!');
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectRepository] Error importing project!',
        error,
        stackTrace,
      );

      rethrow;
    }
  });

  @override
  Stream<Project?> project(int id) =>
      dbProjectService
          .realtimeGet(id)
          .map((project) => project?.let(projectMapper.toModel))
          .doOnData(
            (project) =>
                logger.debug('[$ProjectRepository] Got project: $project'),
          )
          .doOnError(
            (error, stackTrace) => logger.error(
              '[$ProjectRepository] Error getting project with id $id',
              error,
              stackTrace,
            ),
          )
          .safeCode();

  @override
  Stream<List<Project>> projects() =>
      dbProjectService
          .realtimeFetch()
          .map((projectMapper.toModels))
          .doOnData(
            (projects) =>
                logger.debug('[$ProjectRepository] Got projects: $projects'),
          )
          .doOnError(
            (error, stackTrace) => logger.error(
              '[$ProjectRepository] Error getting projects',
              error,
              stackTrace,
            ),
          )
          .safeCode();

  @override
  Future<void> remove(int id) => safeCode(() async {
    try {
      logger.debug('[$ProjectRepository] Removing project with id: $id');

      await dbProjectService.remove(id);
      logger.info('[$ProjectRepository] Project removed successfully!');
    } catch (error, stackTrace) {
      logger.error(
        '[$ProjectRepository] Error removing project with id: $id',
        error,
        stackTrace,
      );

      rethrow;
    }
  });
}
