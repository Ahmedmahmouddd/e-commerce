import 'package:ecommerce/features/authintication/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/authintication/login/presentation/views/login_screen.dart';
import 'package:ecommerce/features/authintication/register/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final phoneController = TextEditingController();
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
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            } else if (state is RegisterFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          'Register to continue process',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ))),
                const SizedBox(height: 20),
                Expanded(
                  flex: 3,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              'REGISTER',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hint: 'Name',
                              controller: nameController,
                            ),
                            CustomTextFormField(
                              hint: 'Email',
                              controller: emailController,
                            ),
                            CustomTextFormField(
                                hint: 'Number', controller: phoneController),
                            CustomTextFormField(
                              hint: 'Password',
                              controller: passwordController,
                              isSecure: true,
                            ),
                            const SizedBox(height: 6),
                            MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context).register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              minWidth: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 22),
                              color: Colors.grey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                state is RegisterLoadingState
                                    ? 'Loading ...'
                                    : 'Register',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black54)),
                                TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()),
                                          (route) => false);
                                    },
                                ),
                              ]),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
