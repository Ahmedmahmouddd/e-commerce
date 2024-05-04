part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class LayoutSuccess extends LayoutState {}

final class LayoutFailure extends LayoutState {
  final String message;
  LayoutFailure({required this.message});
}

final class LayoutLoading extends LayoutState {}
