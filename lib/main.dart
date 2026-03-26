import 'package:flutter/material.dart';
import 'package:ibank/di/injection.dart';
import 'package:ibank/feature/auth/presentation/page/login_page.dart';
import 'package:ibank/feature/auth/presentation/page/signup_page.dart';
import 'package:ibank/feature/home/presentation/page/home_page.dart';


void main() {
  Injection().configDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage()
    );
  }
}

