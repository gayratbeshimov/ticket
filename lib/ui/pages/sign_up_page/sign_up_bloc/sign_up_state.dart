part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;
  final String duplicatePass;
  final bool reload;

  const SignUpState({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.username = "",
    this.password = "",
    this.duplicatePass = "",
    this.reload = false,
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? password,
    String? duplicatePass,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      duplicatePass: duplicatePass ?? this.duplicatePass,
      reload: !reload,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        username,
        password,
        duplicatePass,
        reload,
      ];
}
