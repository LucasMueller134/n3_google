import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'src/app_injections.dart';
import 'src/modules/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjections.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login com Google',
      theme: ThemeData(useMaterial3: true),
      home: const SplashPage(),
    );
  }
}
