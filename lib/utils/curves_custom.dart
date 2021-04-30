import 'package:flutter/animation.dart';

class BackOutCurve extends Curve {
  /// Creates an back-out curve.
  ///
  /// Rather than creating a new instance, consider using [Ease.backOut].
  const BackOutCurve([this.period = 1.5]);

  /// The duration of the oscillation.
  final double period;

  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.5);
    final double _p1 = 1.15;
    final double result = ((t = t - 1) * t * ((_p1 + 1) * t + _p1) + 1);
    return result;
  }

  @override
  String toString() {
    return '$runtimeType($period)';
  }
}