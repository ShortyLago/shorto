import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shorto/components/constants.dart';

import 'screens/home_page.dart';

void main() => runApp(ShortoCalculator());

class ShortoCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kDarkPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: HomePage(),
    );
  }
}
