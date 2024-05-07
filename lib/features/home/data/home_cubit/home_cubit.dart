import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/data/models/banners_model.dart/banner_model.dart';
import 'package:ecommerce/features/home/data/models/category_model/category_model.dart';
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:http/http.dart%20';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BannerModel> banners = [];
  void getBannersData() async {
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(getBannersSuccess());
    } else {
      emit(getBannersFailure(message: responseBody['message']));
    }
  }

  List<CategoryModel> categories = [];
  void getCategoriesData() async {
    emit(getProductsLoading());
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/categories'),
        headers: {'lang': 'en'});
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
      }
      emit(getProductsSuccess());
    } else {
      emit(getCategoriesFailure(message: responseBody['message']));
    }
  }

  List<ProductModel> products = [];
  void getProductsData() async {
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/home'),
      headers: {'Authorization': token!, 'lang': 'en'},
    );
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        products.add(ProductModel.fromJson(data: item));
      }
      emit(getProductsSuccess());
    } else {
      emit(getProductsFailure(message: responseBody['message']));
    }
  }

  List<ProductModel> filteredProducts = [];
  void filterProducts({required String input}) {
    filteredProducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(geFilteredProductsSuccess());
  }
}
