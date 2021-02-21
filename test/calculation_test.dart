import 'package:shorto/calculation.dart';
import 'package:test/test.dart';
import 'package:shorto/components/constants.dart';

void main() {
  group('App basic calculations', () {
    var calculation = Calculation(grappaPercent: grappaPercent, shortoMl: shortoMl);

    test('Defaul calculation', () {
      var grappaml = 255.0;
      var mustml = 445.0;

      expect(calculation.calculateGrappaMl().roundToDouble(), grappaml);
      expect(calculation.calculateMuskMl(grappaml).roundToDouble(), mustml);
    });

    test('Final amount of Shorto', () {
      var grappaml = 255.0;
      var mustml = 445.0;

      expect(grappaml + mustml, shortoMl);
    });
  });
}