part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String username;
  final String password;

  const LoginState({
    this.username = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
