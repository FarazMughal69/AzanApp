part of 'utility_bloc.dart';

sealed class UtilityState extends Equatable {
  const UtilityState();

  @override
  List<Object> get props => [];
}

final class UtilityInitialState extends UtilityState {}

final class UtilityHomeScrollingState extends UtilityState {}
