import 'package:dart_mapper/dart_mapper.dart';
import 'package:fcm_playground/models/message/message.dart';
import 'package:fcm_playground/models/notification/notification.dart';
import 'package:fcm_playground/services/dto/message/message_dto.dart';
import 'package:fcm_playground/services/dto/notification/notification_dto.dart';
import 'package:googleapis/fcm/v1.dart' as googleapis;

part 'message_mapper.g.dart';

Map<String, String>? _toMap(dynamic input) {
  assert(input is Map<String, String>?);

  return input as Map<String, String>?;
}

@Mapper()
abstract class MessageMapper {
  const MessageMapper();

  @Mapping(target: 'data', callable: _toMap)
  googleapis.Message toGoogleApi(MessageDTO message);

  @Mapping(target: 'data', callable: _toMap)
  MessageDTO toDTO(Message message);
}
