import 'package:ecommerce/features/home/data/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => LayoutCubit()..getUserData(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
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
