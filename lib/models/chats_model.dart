import 'package:whatsapp_clone_flutter/models/message_model.dart';

class Chat {
  final String id;
  final String name;
  final String avatar;
  final Message message;
  final int count;

  Chat({
    required this.id,
    required this.name,
    required this.avatar,
    required this.message,
    required this.count,
  });

  Chat copyWith({
    String? id,
    String? name,
    String? avatar,
    Message? message,
    int? count,
  }) {
    return Chat(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      count: count ?? this.count,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'message': message,
      'count': count,
    };
  }

  factory Chat.fromJson(Map<String, dynamic> map) {
    return Chat(
      id: map['id'] ?? '',
      name: map['user']['name'] ?? '',
      avatar: map['user']['image'] ?? '',
      message: Message.fromJson(map['message']),
      count: map['count'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Chat(id: $id, name: $name, avatar: $avatar, message: $message, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.id == id &&
        other.name == name &&
        other.avatar == avatar &&
        other.message == message &&
        other.count == count;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ avatar.hashCode ^ message.hashCode ^ count.hashCode;
  }
}
