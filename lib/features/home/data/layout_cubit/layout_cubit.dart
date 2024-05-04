import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/data/models/usermodel/user_model.dart';
import 'package:ecommerce/features/splash/presentation/views/splash_screen.dart';
import 'package:http/http.dart%20';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  UserModel? userModel;
  void getUserData() async {
    emit(LayoutLoading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/profile'),
      headers: {'Authorization': token!, 'lang': 'en'},
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      userModel = UserModel.fromMap(responseData);
      print('response is $responseData');
      emit(LayoutSuccess());
    } else {
      print('response is $responseData');
      emit(LayoutFailure(message: responseData['message']));
    }
  }
}
