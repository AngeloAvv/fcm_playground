import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pine/pine.dart';

part 'notification_dto.freezed.dart';

@freezed
abstract class NotificationDTO extends DTO with _$NotificationDTO {
  const NotificationDTO._() : super();

  const factory NotificationDTO({String? title, String? body, String? image}) =
      _NotificationDTO;
}
