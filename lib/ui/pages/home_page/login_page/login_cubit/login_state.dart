part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String username;
  final String password;

  const LoginState({
    this.username = '',
    this.password = '',
  });

  LoginState copyWith({
    String? username,
    String? password,
  }) {
    return LoginState(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
