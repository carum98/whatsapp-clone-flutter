import 'package:flutter/painting.dart' show Color;

abstract class ThemeColorsDark {
  static const Color bgColor = Color(0xFF111c21);
  static const Color bgConversationColor = Color(0xFF0b131b);

  static const Color fontColor = Color(0xFFe9edef);
  static const Color headerColor = Color(0xFF202c33);

  static const Color bgMessageIn = Color(0xFF1f2c33);
  static const Color bgMessageOut = Color(0xFF015d4b);

  static const Color indicatorColor = Color(0xFF09a784);
}

abstract class ThemeColorsLight {
  static const Color bgColor = Color(0xFFffffff);
  static const Color bgConversationColor = Color(0xFFdfdfdd);

  static const Color fontColor = Color(0xFF121416);
  static const Color headerColor = Color(0xFF015d4b);

  static const Color bgMessageIn = Color(0xFFffffff);
  static const Color bgMessageOut = Color(0xFFd9fdd3);

  static const Color indicatorColor = Color(0xFFffffff);
}
