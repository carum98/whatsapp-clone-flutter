import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgIcons {
  ball,
  bear,
  car,
  cup,
  flag,
  lightbulb,
  smile,
  symbol,
}

extension SvgIconsExtension on SvgIcons {
  String get svg {
    switch (this) {
      case SvgIcons.ball:
        return 'ball.svg';
      case SvgIcons.bear:
        return 'bear.svg';
      case SvgIcons.car:
        return 'car.svg';
      case SvgIcons.cup:
        return 'cup.svg';
      case SvgIcons.flag:
        return 'flag.svg';
      case SvgIcons.lightbulb:
        return 'lightbulb.svg';
      case SvgIcons.smile:
        return 'smile.svg';
      case SvgIcons.symbol:
        return 'symbol.svg';
    }
  }
}

class SvgIcon extends StatelessWidget {
  final SvgIcons icon;
  final Color color;
  final double? size;

  const SvgIcon({Key? key, required this.icon, this.size, this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${icon.svg}',
      color: color,
      height: size,
      width: size,
    );
  }
}
