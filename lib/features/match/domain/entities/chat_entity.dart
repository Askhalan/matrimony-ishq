// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ishq/features/match/data/models/message_model.dart';

class Chat {
  String? id;
  List<String>? participants;
  List<MessageModel>? messages;
  Chat({
     this.id,
     this.participants,
     this.messages,
  });

}
