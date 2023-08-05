part of 'app_navigation_bloc.dart';

enum AppNavigationType { MAIN, MYTICKETS, BASKET, PROFILE }

class AppNavigationState extends Equatable {
  const AppNavigationState({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
