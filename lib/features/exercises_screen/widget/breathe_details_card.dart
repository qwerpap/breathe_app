import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BreatheDetailsCard extends StatelessWidget {
  const BreatheDetailsCard({
    super.key,
    required this.svg,
    required this.title,
    required this.duration,
  });

  final String svg;
  final String title;
  final int duration;

  double _getRotationAngle() {
    switch (title.toLowerCase()) {
      case 'inhale':
        return pi / 4; // вверх-вправо (↗)
      case 'hold':
        return pi / 2; // вправо (→)
      case 'exhale':
        return pi / 1.5; // вниз-вправо (↘)
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rotation = _getRotationAngle();

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.rotate(
                angle: rotation,
                child: SvgPicture.asset(
                  svg,
                  height: 25,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            '$duration Seconds',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
