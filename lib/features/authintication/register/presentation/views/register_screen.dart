import 'package:ecommerce/features/authintication/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/authintication/register/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static final nameController = TextEditingController();
  static final phoneController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is RegisterFailureState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text(state.message),
                    ));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                          hint: 'Name', controller: nameController),
                      CustomTextFormField(
                          hint: 'Email', controller: emailController),
                      CustomTextFormField(
                          hint: 'Phone', controller: phoneController),
                      CustomTextFormField(
                          isSecure: true,
                          hint: 'Password',
                          controller: passwordController),
                      const SizedBox(height: 6),
                      MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).register(
                                name: nameController.text,
                                phone: phoneController.text,
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
                          state is RegisterLoadingState
                              ? 'Loading ...'
                              : 'Register',
                          style: const TextStyle(
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
            ),
          );
        },
      ),
    );
  }
}
