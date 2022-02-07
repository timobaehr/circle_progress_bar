import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class DoubleValueTextWithCircle extends StatelessWidget {
  const DoubleValueTextWithCircle({
    Key? key,
    required this.consumption,
    required this.maxValue,
    required this.unit,
    this.priceInCents,
    this.currency,
    required this.foregroundColor,
    this.backgroundColor = Colors.black12,
    this.subtitle,
    this.reversedDirection = false,
    this.icon,
  })  : _progress = consumption / maxValue,
        super(key: key);

  static const placeholder = '--';

  final Widget? subtitle;
  final double consumption;
  final double maxValue;
  final Unit unit;

  final double? priceInCents;
  final String? currency;

  final IconData? icon;
  final bool reversedDirection;
  final Color foregroundColor;
  final Color backgroundColor;

  final double _progress;

  @override
  Widget build(BuildContext context) {
    double consumption = this.consumption;
    Unit unit = this.unit;
    final bool switchToM3 = unit == Unit.liter && consumption > 1000;
    if (switchToM3) {
      consumption = consumption / 1000;
      unit = Unit.m3;
    }

    final bool switchToLiters = unit == Unit.m3 && consumption < 1.0;
    if (switchToLiters) {
      consumption = consumption * 1000;
      unit = Unit.liter;
    }

    final innerLayout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (consumption != -1.0)
          AnimatedCount(
            count: consumption,
            unit: unit.name,
            duration: const Duration(milliseconds: 500),
            //unit: unit,
            style: const TextStyle(),
            unitScaleFactor: 0.8,
          )
        else
          const Text(
            placeholder,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        if (priceInCents != null && priceInCents! != 0 && currency != null)
          AnimatedCount(
            count: priceInCents! / 100,
            unit: currency!,
            duration: const Duration(milliseconds: 500),
            //unit: unit,
            style: const TextStyle(),
          )
        //Icon(icon, size: 15, color: Colors.black54)
      ],
    );

    const double size = 105;
    final circle = Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      child: SizedBox(
          width: size,
          height: size,
          child: CircleProgressBar(
            value: _progress,
            reversedDirection: reversedDirection,
            animationDuration: const Duration(milliseconds: 500),
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            child: innerLayout,
          )),
    );
    if (subtitle != null) {
      return Column(
        children: [
          circle,
          const SizedBox(height: 4),
          SizedBox(width: size, child: subtitle!),
        ],
      );
    } else {
      return circle;
    }
  }
}

enum Unit {
  none,
  kWh,
  MWh, // Wärmemengenzähler
  m3,
  liter,
  percent,
  hours,
  kg, // Ofen (engl. stove)
}
