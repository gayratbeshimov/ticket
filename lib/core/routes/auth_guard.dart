import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/ui/pages/sign_up_page/sign_up_page.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: SignUpPage.routeName);

  // AuthGuard() : super(redirectTo: LoginPage.routeName,);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    // check login here
    // if (HiveService.to.getIsLoggedIn()) {
    //   await AccountsCubit.to.load();
    // }
    return true;

    // HiveService.to.getIsLoggedIn();
  }
}
