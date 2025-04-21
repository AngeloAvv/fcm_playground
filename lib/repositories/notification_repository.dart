import 'package:fcm_playground/misc/mappers/message/message_mapper.dart';
import 'package:fcm_playground/misc/mappers/project/project_mapper.dart';
import 'package:fcm_playground/models/message/message.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/repositories/repository.dart';
import 'package:fcm_playground/services/network/notification_service.dart';

/// Abstract class of NotificationRepository
abstract interface class NotificationRepository {
  Future<void> send(
    Message message, {
    required Project project,
    bool validateOnly = false,
  });
}

/// Implementation of the base interface NotificationRepository
class NotificationRepositoryImpl extends Repository
    implements NotificationRepository {
  final NotificationService notificationService;
  final MessageMapper messageMapper;
  final ProjectMapper projectMapper;

  const NotificationRepositoryImpl({
    required this.notificationService,
    required this.messageMapper,
    required this.projectMapper,
    required super.logger,
  });

  @override
  Future<void> send(
    Message message, {
    required Project project,
    bool validateOnly = false,
  }) => safeCode(() async {
    try {
      logger.debug(
        '[$NotificationRepository] Sending notification: $message',
      );

      final dto = messageMapper.toDTO(message);
      final credentials = projectMapper.toServiceCredentialsDTO(project);

      logger.debug(
        '[$NotificationRepository] Sending notification with credentials: $credentials',
      );

      await notificationService.send(
        dto,
        credentials: credentials,
        validateOnly: validateOnly,
      );

      logger.info('[$NotificationRepository] Notification sent successfully');
    } catch (error, stackTrace) {
      logger.error(
        '[$NotificationRepository] Error sending notification: $error',
        error,
        stackTrace,
      );

      rethrow;
    }
  });
}
