part of 'notification_bloc.dart';

@freezed
sealed class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = InitialNotificationState;

  const factory NotificationState.sending() = SendingNotificationState;

  const factory NotificationState.sent() = SentNotificationState;

  const factory NotificationState.errorSending(LocalizedError error) =
      ErrorSendingNotificationState;
}
