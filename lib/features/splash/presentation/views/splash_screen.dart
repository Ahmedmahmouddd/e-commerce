import 'package:ecommerce/features/authintication/sign_up/presentation/views/register_screen.dart';
// import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const RegisterScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Image.asset('assets/images/shopping_cart.png',
                        width: 150, height: 150))),
            const Text('Developed By Ahmed'),
          ],
        ),
      ),
    );
  }
}
