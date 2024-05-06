import 'package:ecommerce/core/cache_data/cache_data.dart';
import 'package:ecommerce/features/authintication/data/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/home/data/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/layout/data/layout_cubit/layout_cubit.dart';
import 'package:ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.casheInitialization();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
              create: (context) => HomeCubit()
                ..getBannersData()
                ..getCategoriesData()
                ..getProductsData()),
          BlocProvider(create: (context) => LayoutCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
