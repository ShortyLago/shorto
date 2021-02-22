import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorto/screens/home_page.dart';

Widget _makeWidgetTestable(Widget widget) => MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget,),);
void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(_makeWidgetTestable(HomePage()), const Duration(seconds: 2));
    final titleText = find.text('Shorto Calculator');
    final welcomeText = find.text('Welcome');
    expect(titleText, findsOneWidget);
    expect(welcomeText, findsOneWidget);
  });
}