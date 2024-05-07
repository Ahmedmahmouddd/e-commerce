import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/cart_screen.dart';
import 'package:ecommerce/features/categories/features/views/categories_screen.dart';
import 'package:ecommerce/features/favourits/favourits_screen.dart';
import 'package:ecommerce/features/home/features/views/home_screen.dart';
import 'package:ecommerce/features/profile/features/views/profile_screen.dart';
import 'package:flutter/material.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int bottomNavIndex = 0;
  List<Widget> layoutScreens = const [
    CategoriesScreen(),
    CartScreen(),
    HomeScreen(),
    FavouritsScreen(),
    ProfileScreen(),
  ];
  void changeBottomNavIndex({required int index}) {
    bottomNavIndex = index;
    emit(ChangeBottomNavIndexState());
  }

 
}
