import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/purchase_provider.dart';
//import 'package:my_app/screens/Auth/signup_screen.dart';
import 'package:my_app/screens/Auth/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PurchaseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestPustak',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(), // Removed 'const' to fix "Not a constant expression" error
    );
  }
}
