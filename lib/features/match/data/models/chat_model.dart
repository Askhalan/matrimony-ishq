import 'package:ishq/features/match/data/models/message_model.dart';

class Chat {
  String? id;
  List<String>? participants;
  List<Message>? messages;

  Chat({
    required this.id,
    required this.participants,
    required this.messages,
  });

  // Factory constructor for creating a new Chat instance from a map
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      participants: List<String>.from(json['participants']),
      messages: List<Message>.from(
        json['messages']?.map((m) => Message.fromJson(m)) ?? [],
      ),
    );
  }

  // Method to convert a Chat instance into a map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['participants'] = participants;
    data['messages'] = messages?.map((m) => m.toJson()).toList() ?? [];
    return data;
  }
}
