part of 'notification_bloc.dart';

@freezed
sealed class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.send(
    Message message, {
    required Project project,
  }) = SendNotificationEvent;
}
