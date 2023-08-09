part of 'app_navigation_bloc.dart';

enum AppNavigationType { EVENT, MYTICKETS, BASKET, PROFILE }

class AppNavigationState extends Equatable {
  const AppNavigationState({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
