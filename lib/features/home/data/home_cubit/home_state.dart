// ignore_for_file: camel_case_types

part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class getBannersLoading extends HomeState {}

final class getBannersSuccess extends HomeState {}

final class getBannersFailure extends HomeState {
  final String message;
  getBannersFailure({required this.message});
}

final class getCategoriesSuccess extends HomeState {}

final class getCategoriesFailure extends HomeState {
  final String message;
  getCategoriesFailure({required this.message});
}

final class getProductsSuccess extends HomeState {}

final class getProductsFailure extends HomeState {
  final String message;
  getProductsFailure({required this.message});
}
