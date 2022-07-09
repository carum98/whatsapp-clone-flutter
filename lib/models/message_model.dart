class Message {
  final String id;
  final String content;
  final bool isMine;
  final bool isRead;
  final DateTime date;

  Message({
    required this.id,
    required this.content,
    required this.isMine,
    required this.isRead,
    required this.date,
  });

  Message copyWith({
    String? id,
    String? content,
    bool? isMine,
    bool? isRead,
    DateTime? date,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      isMine: isMine ?? this.isMine,
      isRead: isRead ?? this.isRead,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'isMine': isMine,
      'isRead': isRead,
      'date': date,
    };
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      isMine: map['isMine'] ?? false,
      isRead: map['isRead'] ?? false,
      date: DateTime.parse(map['createdAt'] ?? '').toLocal(),
    );
  }

  @override
  String toString() {
    return 'Message(id: $id, content: $content, isMine: $isMine, isRead: $isRead, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.content == content &&
        other.isMine == isMine &&
        other.isRead == isRead &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ isMine.hashCode ^ isRead.hashCode ^ date.hashCode;
  }
}
