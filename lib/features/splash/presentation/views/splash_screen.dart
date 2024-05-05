import 'package:ecommerce/features/authintication/presentation/views/login_screen.dart';
import 'package:ecommerce/features/layout/features/views/layout_screen.dart';
// import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      getValidationData().then((_) {
        token == null
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              )
            : Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LayoutScreen()),
                (route) => false,
              );
      });
    });
  }

  Future<void> getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('token');
    setState(() {
      token = obtainedToken;
    });
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
