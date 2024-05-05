import 'package:ecommerce/features/layout/data/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  final Color black = Colors.black;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.bottomNavIndex,
            selectedItemColor: black,
            unselectedItemColor: Colors.black38,
            selectedLabelStyle:
                TextStyle(color: black, fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: const TextStyle(
                color: Colors.black38, fontWeight: FontWeight.bold),
            onTap: (index) {
              cubit.changeBottomNavIndex(index: index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favourits'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
          body: cubit.layoutScreens[cubit.bottomNavIndex],
        );
      },
    );
  }
}
