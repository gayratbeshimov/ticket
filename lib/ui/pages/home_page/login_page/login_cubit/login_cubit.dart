import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/services/hive_service.dart';
import 'package:ticket/core/utils/app_logger_util.dart';
import 'package:ticket/ui/pages/home_page/home_page.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  static LoginCubit get to=> Modular.get<LoginCubit>();
  LoginCubit() : super(const LoginState());

  void usernameAndPassword({
    required String username,
    required String password,
  }) {
    emit(state.copyWith(
      username: username,
      password: password,
    ));
  }

  Future login() async {
    try {
      // bool login = await SignUpAndLoginService.to.login(
      //   username: state.username,
      //   password: state.password,
      // );
      // if (login) {
      //   HiveService.to.setIsLoggedIn(true);
      //   Modular.to.pushNamed(HomePage.routeName);
      // } else {
      //   AppWidgets.showText(text: "Password or username is incorrect");
      // }

      HiveService.to.setIsLoggedIn(true);
      Modular.to.pushNamed(HomePage.routeName);
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }
}
