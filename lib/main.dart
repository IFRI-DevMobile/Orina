import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'notifications_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: ThemeData(
        primaryColor: const Color(0xFFD18B3E),
        scaffoldBackgroundColor: const Color(0xFFF7F4EF),
      ),
      home: const NotificationsPage(),
    );
  }
}
