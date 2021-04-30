import 'package:flutter/material.dart';
import 'package:kipos_app/views/onboarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    ),
  );
}
