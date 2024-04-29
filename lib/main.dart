import 'package:ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
