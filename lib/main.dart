import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tripwise/pages/home_page.dart';
import 'firebase_options.dart';

import 'package:tripwise/shared/app_navigator.dart';
import 'package:tripwise/pages/user/login_page.dart';
import 'package:tripwise/pages/user/register_page.dart';
import 'package:tripwise/pages/map_page.dart';
import 'package:tripwise/pages/user/forgot_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripWise',
      initialRoute: '/',
      routes: {
        '/': (context) => const AppNavigator(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPassword(),
      },
    );
  }
}
