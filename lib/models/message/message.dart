import 'package:fcm_playground/models/notification/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message with _$Message {
  const Message._();

  const factory Message({
    Notification? notification,
    Map<String, String>? data,
    String? token,
    String? topic,
  }) = _Message;
}
