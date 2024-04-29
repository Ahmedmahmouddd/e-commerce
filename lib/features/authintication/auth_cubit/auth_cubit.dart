import 'dart:convert';

import 'package:bloc/bloc.dart';
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
      headers: {
        'lang': 'en',
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      print(responseBody);
      emit(RegisterSuccessState());
    } else {
      print(responseBody);

      emit(RegisterFailureState(message: responseBody['message']));
    }
  }
}
