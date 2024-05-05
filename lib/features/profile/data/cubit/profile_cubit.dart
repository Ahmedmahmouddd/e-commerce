import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/profile/data/models/usermodel/user_model.dart';
import 'package:ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  UserModel? userModel;
  void getUserData() async {
    emit(ProfileLoading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/profile'),
      headers: {'Authorization': token!, 'lang': 'en'},
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      userModel = UserModel.fromMap(responseData);
      emit(ProfileSuccess());
    } else {
      emit(ProfileFailure(message: responseData['message']));
    }
  }
}
