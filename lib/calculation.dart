import 'package:flutter/cupertino.dart';

class Calculation {
  Calculation({@required this.grappaPercent, @required this.shortoMl});

  final double grappaPercent;
  final double shortoMl;

  double calculateGrappaMl() {
    return ((0.12 * shortoMl) / ((grappaPercent * 0.01) - 0.07));
  }

  double calculateMuskMl(double grappaMl) {
    return (shortoMl - grappaMl);
  }
}
