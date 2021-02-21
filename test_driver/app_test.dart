import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// For run this test suite run this in terminal
// flutter drive --target=test_driver/app.dart

void main() {
  group('Testing App Performance Tests', () {
    final titleText = find.byValueKey('title');
    final text1 = find.byValueKey('text_1');
    final text2 = find.byValueKey('text_2');
    final text3 = find.byValueKey('text_3');
    final text4 = find.byValueKey('text_4');
    final text5 = find.byValueKey('text_5');
    final text6 = find.byValueKey('text_6');
    final text7 = find.byValueKey('text_7');
    final text8 = find.byValueKey('text_8');
    final calcBtn = find.byValueKey('calc_btn');
    final btnGrappaPercMinus = find.byValueKey('btn_grappa_perc_minus');
    final btnGrappaPercPlus = find.byValueKey('btn_grappa_perc_plus');
    final btnShortoMlMinus = find.byValueKey('btn_shorto_ml_minus');
    final btnShortoMlPlus = find.byValueKey('btn_shorto_ml_plus');
    final backBtn = find.byValueKey('back_btn');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('home_page tests', () async {
      expect(await driver.getText(titleText), 'Shorto Calculator - Home');
      expect(await driver.getText(text1), 'Welcome');
      expect(await driver.getText(text2), 'Enjoy!');
      expect(await driver.getText(text3), 'Shorty');
      expect(await driver.getText(calcBtn), 'START');
      await driver.tap(calcBtn);
    });

    test('inputs_page tests', () async{
      expect(await driver.getText(titleText), 'Shorto Calculator - Inputs');
      expect(await driver.getText(text1), 'Grappa');
      expect(await driver.getText(text2), 'Alcohol');
      expect(await driver.getText(text3), '40');
      expect(await driver.getText(text4), '%');
      expect(await driver.getText(text5), 'Shorto');
      expect(await driver.getText(text6), 'Final amount');
      expect(await driver.getText(text7), '700');
      expect(await driver.getText(text8), 'ml');
      expect(await driver.getText(calcBtn), 'CALCULATE');
      await driver.tap(btnGrappaPercMinus);
      expect(await driver.getText(text3), '39');
      await driver.tap(btnGrappaPercPlus);
      await driver.tap(btnGrappaPercPlus);
      expect(await driver.getText(text3), '41');
      await driver.tap(btnShortoMlMinus);
      expect(await driver.getText(text3), '699');
      await driver.tap(btnShortoMlPlus);
      await driver.tap(btnShortoMlPlus);
      expect(await driver.getText(text3), '701');
      await driver.tap(calcBtn);
    });

    test('results_page tests', () async{
      expect(await driver.getText(titleText), 'Shorto Calculator - Results');
      expect(await driver.getText(text1), 'Results:');
      expect(await driver.getText(text2), 'Mix');
      expect(await driver.getText(text3), 'Grappa');
      expect(await driver.getText(text4), 'with');
      expect(await driver.getText(text5), 'grape must');
      expect(await driver.getText(text6), 'to create');
      expect(await driver.getText(text7), 'nShorto');
      expect(await driver.getText(calcBtn), 'RE-CALCULATE');
      await driver.tap(calcBtn);
      expect(await driver.getText(titleText), 'Shorto Calculator - Inputs');
      await driver.tap(backBtn);
      expect(await driver.getText(titleText), 'Shorto Calculator - Home');
    });
  });
}