// ignore_for_file: constant_identifier_names

import 'package:whatsapp_clone_flutter/widgets/svg_icon.dart';

class Emoji {
  final String emoji;
  final String description;
  final String category;

  const Emoji({
    required this.emoji,
    required this.description,
    required this.category,
  });

  Emoji copyWith({
    String? emoji,
    String? description,
    String? category,
  }) {
    return Emoji(
      emoji: emoji ?? this.emoji,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emoji': emoji,
      'description': description,
      'category': category,
    };
  }

  Emoji.fromJson(Map<String, dynamic> map)
      : emoji = map['emoji'] ?? '',
        description = map['description'] ?? '',
        category = map['category'] ?? '';

  @override
  String toString() => 'Emoji(emoji: $emoji, description: $description, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Emoji &&
        other.emoji == emoji &&
        other.description == description &&
        other.category == category;
  }

  @override
  int get hashCode => emoji.hashCode ^ description.hashCode ^ category.hashCode;
}

const EmojiCategoryIcons = {
  'Smileys & Emotion': SvgIcons.smile,
  'People & Body': SvgIcons.bear,
  'Animals & Nature': SvgIcons.bear,
  'Food & Drink': SvgIcons.cup,
  'Travel & Places': SvgIcons.ball,
  'Activities': SvgIcons.car,
  'Objects': SvgIcons.lightbulb,
  'Symbols': SvgIcons.symbol,
  'Flags': SvgIcons.flag,
};

class EmojiCategory {
  final String name;
  final List<Emoji> emojis;
  final SvgIcons icon;

  const EmojiCategory({
    required this.name,
    required this.emojis,
    required this.icon,
  });

  EmojiCategory copyWith({
    String? name,
    List<Emoji>? emojis,
    SvgIcons? icon,
  }) {
    return EmojiCategory(
      name: name ?? this.name,
      emojis: emojis ?? this.emojis,
      icon: icon ?? this.icon,
    );
  }

  EmojiCategory.fromJson(this.name, List<dynamic> emojis)
      : emojis = emojis.map((e) => Emoji.fromJson(e as Map<String, dynamic>)).toList(),
        icon = EmojiCategoryIcons[name]!;

  @override
  String toString() => 'EmojiCategory(name: $name, emojis: $emojis)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmojiCategory && other.name == name && other.emojis == emojis;
  }

  @override
  int get hashCode => name.hashCode ^ emojis.hashCode;
}
