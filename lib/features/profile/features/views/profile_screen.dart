import 'package:ecommerce/features/profile/data/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text('data'),
              ),
              body: cubit.userModel != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cubit.userModel!.name),
                        const SizedBox(height: 8),
                        Text(cubit.userModel!.email)
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        },
      ),
    ));
  }
}
