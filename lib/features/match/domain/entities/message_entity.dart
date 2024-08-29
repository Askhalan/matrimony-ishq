// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? senderID;
  String? content;
  MessageType? messageType;
  Timestamp? sentAt;
  Message({
     this.senderID,
     this.content,
     this.sentAt,
     this.messageType
  });
}
enum MessageType { text, image }