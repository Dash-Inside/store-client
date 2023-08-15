part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  @override
  List<Object> get props => [];

  const NavigationState();
}

final class InitNavigationState extends NavigationState {}
