import 'package:ecommerce/features/authintication/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/authintication/register/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            } else if (state is LoginFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                              hint: 'UserName', controller: emailController),
                          CustomTextFormField(
                              isSecure: true,
                              hint: 'Password',
                              controller: passwordController),
                          MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            minWidth: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            color: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              state is LoginLoadingState
                                  ? 'Loading ...'
                                  : 'Login',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black54)),
                              TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54))
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
