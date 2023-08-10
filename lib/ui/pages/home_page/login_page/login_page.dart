import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/utils/assets.gen.dart';
import 'package:ticket/core/utils/colors.gen.dart';
import 'package:ticket/ui/pages/home_page/login_page/login_cubit/login_cubit.dart';
import 'package:ticket/ui/widgets/app_text_field.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';
import 'package:ticket/ui/widgets/fade_animation.dart';

class LoginPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginPage.routeName,
          child: (context, args) => const LoginPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<LoginCubit>(
          (i) => LoginCubit(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: BlocBuilder<LoginCubit, LoginState>(
              bloc: LoginCubit.to,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 0.8,
                      child: AppWidgets.appButton(
                        title: "back",
                        color: ColorName.white,
                        textColor: ColorName.green1,
                        fontSize: 12.sp,
                        width: 80.w,
                        height: 30.w,
                        icon: Assets.images.icons.backArrow
                            .svg(color: ColorName.green1)
                            .paddingOnly(right: 10.w),
                        onTap: () {
                          Modular.to.pop();
                        },
                      ),
                    ).paddingOnly(top: 20.w, bottom: 20.w),
                    FadeAnimation(
                      delay: .9,
                      child: AppWidgets.appName().paddingOnly(
                        top: 20.w,
                        bottom: 10.w,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.0,
                      child: AppWidgets.textLocale(
                        localeKey: "Login",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        color: ColorName.green1,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.1,
                      child: AppTextField(
                        hintText: "User name",
                        onChanged: (v) {
                          LoginCubit.to.usernameAndPassword(
                              username: v, password: state.username);
                        },
                        title: "User name",
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: AppTextField(
                        hintText: "Password",
                        onChanged: (v) {
                          LoginCubit.to.usernameAndPassword(
                            username: state.username,
                            password: v,
                          );
                        },
                        title: "Password",
                        isPassword: true,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.3,
                      child: AppWidgets.appButton(
                        title: "Login",
                        onTap: () {
                          LoginCubit.to.login();
                        },
                      ).paddingOnly(top: 20.w),
                    ),
                  ],
                );
              },
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}
