import 'package:ecommerce/features/authintication/register/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/market_background.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 50),
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      'Login to continue process',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ))),
            Expanded(
              flex: 5,
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      CustomTextFormField(
                          hint: 'UserName', controller: emailController),
                      CustomTextFormField(
                          hint: 'Password', controller: passwordController),
                      MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // BlocProvider.of<AuthCubit>(context).register(
                            //     name: nameController.text,
                            //     phone: phoneController.text,
                            //     email: emailController.text,
                            //     password: passwordController.text);
                          }
                        },
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        color: Colors.grey[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: const Text(
                          // state is RegisterLoadingState
                          //     ? 'Loading ...'
                          //     :
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
