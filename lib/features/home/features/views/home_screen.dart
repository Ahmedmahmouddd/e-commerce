import 'package:ecommerce/core/cache_data/cache_data.dart';
import 'package:ecommerce/features/authintication/login/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onTap: () {
              CacheData.clearData(key: 'token');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false, // Remove all routes
              );
            },
            child: Text('data')),
      ),
    );
  }
}
