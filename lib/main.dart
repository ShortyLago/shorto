import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(ShortoCalculator());

class ShortoCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF7B1FA2),
        scaffoldBackgroundColor: Color(0xFF757575),
      ),
      home: HomePage(),
    );
  }
}
