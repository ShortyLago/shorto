import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shorto/components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'screens/home_page.dart';
import 'package:flutter_driver/driver_extension.dart';

Future<void> main() async {
  enableFlutterDriverExtension();
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://e11e094b7f7f4f06ae68e24307fa4981@o524914.ingest.sentry.io/5638194';
    },
    appRunner: () => runApp(ShortoCalculator()),
  );
}
// void main() => runApp(ShortoCalculator());

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
