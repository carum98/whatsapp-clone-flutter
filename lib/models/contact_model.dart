class Contact {
  final String id;
  final String name;
  final String number;
  final String avatar;

  Contact({
    required this.id,
    required this.name,
    required this.number,
    required this.avatar,
  });

  Contact copyWith({
    String? id,
    String? name,
    String? number,
    String? avatar,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'avatar': avatar,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      avatar: map['image'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, number: $number, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.id == id &&
        other.name == name &&
        other.number == number &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ number.hashCode ^ avatar.hashCode;
  }
}
