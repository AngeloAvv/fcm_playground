import 'package:fcm_playground/services/dto/notification/notification_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';

@freezed
abstract class MessageDTO with _$MessageDTO {
  const factory MessageDTO({
    NotificationDTO? notification,
    Map<String, String>? data,
    String? token,
    String? topic,
  }) = _MessageDTO;
}
