import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/constants/api_const.dart';
import 'package:ticket/core/services/http_service/http_service.dart';
import 'package:ticket/core/utils/app_logger_util.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';

class SignUpAndLoginService with APIConst {
  static SignUpAndLoginService get to => Modular.get<SignUpAndLoginService>();

  FutureOr signUp({
    required String firstName,
    required String lastname,
    required String username,
    required String email,
    required String password,
    required String duplicatePass,
  }) async {
    try {
      var body = {
        "first_name": firstName,
        "last_name": lastname,
        "email": email,
        "username": username,
        "password": password,
        "password1": duplicatePass
      };
      Response? response = await HttpService.to.post(
        apiURL: apiURL,
        path: signUpURL,
        body: body,
      );
      if (response != null) {
        if (response.statusCode == 201) {
          AppWidgets.showText(text: "${response.data}");
          return true;
        } else if (response.statusCode == 200) {
          AppWidgets.showText(text: "${json.decode(response.data)}");
          return false;
        } else {
          AppWidgets.showText(text: "${json.decode(response.data)}");
          return false;
        }
      }
      return null;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  FutureOr login({
    required String username,
    required String password,
  }) async {
    try {
      var body = {
        "username": username,
        "password": password,
      };
      Response? response = await HttpService.to.post(
        apiURL: apiURL,
        path: loginURL,
        body: body,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }
}
