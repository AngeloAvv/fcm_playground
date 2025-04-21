import 'dart:io';

import 'package:fcm_playground/services/dto/service_account_credentials_dto.dart';
import 'package:fcm_playground/services/service.dart';

/// Abstract class of ProjectService
abstract interface class ProjectService {
  Future<ServiceAccountCredentialsDTO> parse(String path);
}

/// Implementation of the base interface ProjectService
class ProjectServiceImpl extends Service implements ProjectService {
  const ProjectServiceImpl({required super.logger});

  @override
  Future<ServiceAccountCredentialsDTO> parse(String path) async {
    try {
      logger.debug('[$ProjectService] Parsing project from path: $path');
      final data = File(path).readAsStringSync();
      logger.debug('[$ProjectService] Project data: $data');

      logger.debug('[$ProjectService] Parsing project data to DTO');
      final project = ServiceAccountCredentialsDTO.fromJson(data);
      logger.info('[$ProjectService] Project parsed: $project');

      return project;
    } catch (error, stackTrace) {
      logger.error('[$ProjectService] Error parsing project!', error, stackTrace);

      rethrow;
    }
  }
}
