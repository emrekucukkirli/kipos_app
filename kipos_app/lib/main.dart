import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kipos_app/views/onboarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    ),
  );
}
