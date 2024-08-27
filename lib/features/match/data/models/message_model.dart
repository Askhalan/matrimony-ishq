import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, image }

class Message {
  String? senderID;
  String? content;
  MessageType? messageType;
  Timestamp? sentAt;

  Message({
    required this.senderID,
    required this.content,
    required this.messageType,
    required this.sentAt,
  });

  // Factory constructor for creating a new Message instance from a map
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderID: json['senderID'],
      content: json['content'],
      sentAt: json['sentAt'],
      messageType: MessageType.values.byName(json['messageType']),
    );
  }

  // Method to convert a Message instance into a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['senderID'] = senderID;
    data['content'] = content;
    data['sentAt'] = sentAt;
    data['messageType'] = messageType?.name;
    return data;
  }
}
