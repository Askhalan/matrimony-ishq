import 'package:ishq/features/match/domain/entities/message_entity.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.senderID,
      required super.content,
      required super.sentAt,
      required super.messageType});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderID: json['senderID'],
      content: json['content'],
      sentAt: json['sentAt'],
      messageType: json['messageType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'senderID': senderID,
        'content': content,
        'sentAt': sentAt,
        'messageType': messageType
      };
}
