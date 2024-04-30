import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/register'),
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password
      },
      headers: {'lang': 'en'},
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      print('User registered successfully and his data is $responseBody');
      emit(RegisterSuccessState());
    } else {
      print(responseBody);
      emit(RegisterFailureState(message: responseBody['message']));
    }
  }

//
//
//

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/login'),
      body: {
        'email': email,
        'password': password,
      },
      headers: {'lang': 'en'},
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      print('User logged in successfully and his data is $responseBody');
      emit(LoginSuccessState());
    } else {
      print(responseBody);
      emit(LoginFailureState(message: responseBody['message']));
    }
  }
}
