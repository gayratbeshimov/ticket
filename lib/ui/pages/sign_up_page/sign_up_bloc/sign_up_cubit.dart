import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/utils/app_logger_util.dart';
import 'package:ticket/ui/pages/home_page/login_page/login_page.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  static SignUpCubit get to => Modular.get<SignUpCubit>();

  void name({
    required String firstName,
    required String lastname,
    required String username,
    required String email,
    required String password,
    required String duplicatePass,
  }) {
    emit(state.copyWith(
      firstName: firstName,
      lastName: lastname,
      username: username,
      email: email,
      password: password,
      duplicatePass: duplicatePass,
    ));
  }

  bool checkEmpty() {
    if (state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.username.isNotEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.duplicatePass.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPasswords() {
    if (state.password.length > 7 && state.password == state.duplicatePass) {
      return true;
    } else {
      return false;
    }
  }

  FutureOr signup() async {
    try {
      if (checkEmpty()) {
        if (checkPasswords()) {
          Modular.to.pushNamed(LoginPage.routeName);
          // var response = await SignUpAndLoginService.to.signUp(
          //   firstName: state.firstName,
          //   lastname: state.lastName,
          //   username: state.username.trim(),
          //   email: state.email.trim(),
          //   password: state.password.trim(),
          //   duplicatePass: state.duplicatePass.trim(),
          // );
          // if (response != null && response as bool) {
          //   Modular.to.pushNamed(LoginPage.routeName);
          // } else {
          //   AppWidgets.showText(text: "Error");
          // }
        } else {
          AppWidgets.showText(
              text: "Password is not equal to duplicate password");
        }
      } else {
        AppWidgets.showText(text: "Fill in all the fields");
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }
}
