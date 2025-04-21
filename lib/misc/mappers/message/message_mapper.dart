import 'package:dart_mapper/dart_mapper.dart';
import 'package:fcm_playground/models/message/message.dart';
import 'package:fcm_playground/services/dto/message/message_dto.dart';
import 'package:fcm_playground/services/dto/notification/notification_dto.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:googleapis/fcm/v1.dart' as googleapis;

part 'message_mapper.g.dart';

@Mapper()
abstract class MessageMapper {
  const MessageMapper();

  googleapis.Message toGoogleApi(MessageDTO message) {
    return googleapis.Message(
      notification: message.notification?.let(
        (notification) => googleapis.Notification(
          title: notification.title,
          body: notification.body,
          image: notification.image,
        ),
      ),
      data: message.data,
      token: message.token,
      topic: message.topic,
    );
  }

  MessageDTO toDTO(Message message) {
    return MessageDTO(
      notification: message.notification?.let(
        (notification) => NotificationDTO(
          title: notification.title,
          body: notification.body,
          image: notification.image,
        ),
      ),
      data: message.data,
      token: message.token,
      topic: message.topic,
    );
  }
}
