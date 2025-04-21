import 'dart:async';

import 'package:fcm_playground/errors/generic_error.dart';
import 'package:fcm_playground/models/message/message.dart';
import 'package:fcm_playground/models/project/project.dart';
import 'package:fcm_playground/repositories/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// The NotificationBloc
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;

  /// Create a new instance of [NotificationBloc].
  NotificationBloc({required this.notificationRepository})
    : super(const NotificationState.initial()) {
    on<SendNotificationEvent>(_onSend);
  }

  /// Method used to add the [SendNotificationEvent] event
  void send(Message message, {required Project project}) =>
      add(SendNotificationEvent(message, project: project));

  FutureOr<void> _onSend(
    SendNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.sending());

    try {
      await notificationRepository.send(event.message, project: event.project);

      emit(const NotificationState.sent());
    } on LocalizedError catch (error) {
      emit(NotificationState.errorSending(error));
    } catch (_) {
      emit(NotificationState.errorSending(GenericError()));
    }
  }
}

extension NotificationBlocExtension on BuildContext {
  /// Extension method used to get the [NotificationBloc] instance
  NotificationBloc get notificationBloc => read<NotificationBloc>();

  /// Extension method used to watch the [NotificationBloc] instance
  NotificationBloc get watchNotificationBloc => watch<NotificationBloc>();
}
