import 'package:ishq/features/app/data/models/message_model.dart';
import 'package:ishq/features/app/domain/entities/chat_entity.dart';

class ChatModel extends Chat {
  ChatModel({super.id, super.participants, super.messages});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      participants: List<String>.from(json['participants']),
      messages: List<MessageModel>.from(
        json['messages']?.map((m) => MessageModel.fromJson(m)) ?? [],
      ),
  
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['participants'] = participants;
    data['messages'] = messages?.map((m) => m.toJson()).toList() ?? [];
    return data;
  }
}
