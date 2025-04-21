import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';

@freezed
abstract class NotificationDTO with _$NotificationDTO {
  const factory NotificationDTO({String? title, String? body, String? image}) =
      _NotificationDTO;
}
