import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/data/models/banners_model.dart/banner_model.dart';
import 'package:ecommerce/features/home/data/models/category_model/category_model.dart';
import 'package:http/http.dart%20';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(getBannersInitial());

  List<BannerModel> banners = [];
  void getBannersData() async {
    emit(getCategoriesLoading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(BannerModel.fromJson(data: item));
      }
      emit(getCategoriesSuccess());
    } else {
      emit(getCategoriesFailure(message: responseBody['message']));
    }
  }

  List<CategoryModel> categories = [];
  void getCategoriesData() async {
    emit(getCategoriesLoading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
    );
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(CategoryModel.fromJson(data: item));
      }
      emit(getCategoriesSuccess());
    } else {
      emit(getCategoriesFailure(message: responseBody['message']));
    }
  }
}
