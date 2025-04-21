import 'package:fcm_playground/misc/mappers/message/message_mapper.dart';
import 'package:fcm_playground/services/dto/message/message_dto.dart';
import 'package:fcm_playground/services/dto/service_account_credentials_dto.dart';
import 'package:fcm_playground/services/service.dart';
import 'package:googleapis/fcm/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

/// Abstract class of NotificationService
abstract interface class NotificationService {
  Future<void> send(
    MessageDTO message, {
    required ServiceAccountCredentialsDTO credentials,
    bool validateOnly = false,
  });
}

/// Implementation of the base interface NotificationService
class NotificationServiceImpl extends Service implements NotificationService {
  final MessageMapper messageMapper;

  const NotificationServiceImpl({
    required this.messageMapper,
    required super.logger,
  });

  @override
  Future<void> send(
    MessageDTO message, {
    required ServiceAccountCredentialsDTO credentials,
    bool validateOnly = false,
  }) async {
    late http.Client client;

    try {
      logger.info('[$NotificationService] Creating client');
      client = await clientViaServiceAccount(credentials, [
        FirebaseCloudMessagingApi.firebaseMessagingScope,
      ]);
      logger.info('[$NotificationService] Client created successfully');

      logger.info('[$NotificationService] Creating FCM API');
      final fcmApi = FirebaseCloudMessagingApi(client);
      logger.info('[$NotificationService] FCM API created successfully');

      logger.info('[$NotificationService] Mapping message');
      final dto = messageMapper.toGoogleApi(message);
      logger.info('[$NotificationService] Message mapped successfully');

      logger.info('[$NotificationService] Sending notification');
      await fcmApi.projects.messages.send(
        SendMessageRequest(message: dto, validateOnly: validateOnly),
        'projects/${credentials.projectId}',
      );
      logger.info('[$NotificationService] Notification sent successfully');
    } catch (error, stackTrace) {
      logger.error(
        '[$NotificationService] Error sending notification: $error',
        error,
        stackTrace,
      );

      rethrow;
    } finally {
      logger.info('[$NotificationService] Closing client');
      client.close();
      logger.info('[$NotificationService] Client closed successfully');
    }
  }
}
