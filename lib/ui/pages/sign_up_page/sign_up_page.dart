import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/utils/assets.gen.dart';
import 'package:ticket/ui/pages/home_page/login_page/login_page.dart';
import 'package:ticket/ui/pages/sign_up_page/sign_up_bloc/sign_up_cubit.dart';
import 'package:ticket/ui/widgets/app_text_field.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';
import 'package:ticket/ui/widgets/fade_animation.dart';

import '../../../core/utils/colors.gen.dart';

class SignupModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SignUpPage.routeName,
          child: (context, args) => const SignUpPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<SignUpCubit>(
          (i) => SignUpCubit(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: BlocBuilder<SignUpCubit, SignUpState>(
              bloc: SignUpCubit.to,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 0.6,
                      child: GestureDetector(
                        child: Assets.images.icons.backArrow.svg(),
                        onTap: () {
                          Modular.to.pop();
                        },
                      ),
                    ),
                    FadeAnimation(
                      delay: 0.7,
                      child: AppWidgets.textLocale(
                          localeKey: "///E-///Ticket",
                          isRichText: true,
                          othersMarkers: [
                            MarkerText(
                                marker: '///',
                                style: const TextStyle(
                                    color: Colors.orangeAccent
                                )
                            ),

                          ],
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              color: ColorName.green1)
                          .paddingOnly(
                        top: 20.w,
                        bottom: 10.w,
                      ),
                    ),
                    FadeAnimation(
                      delay: 0.75,
                      child: AppWidgets.textLocale(
                        localeKey: "Sign up",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        color: ColorName.green1,
                      ),
                    ),
                    FadeAnimation(
                      delay: 0.8,
                      child: AppTextField(
                        hintText: "First name",
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: v,
                            lastname: state.lastName,
                            username: state.username,
                            email: state.email,
                            password: state.password,
                            duplicatePass: state.duplicatePass,
                          );
                        },
                        title: "First name",
                      ),
                    ),
                    FadeAnimation(
                      delay: 0.9,
                      child: AppTextField(
                        hintText: "Last name",
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: state.firstName,
                            lastname: v,
                            username: state.username,
                            email: state.email,
                            password: state.password,
                            duplicatePass: state.duplicatePass,
                          );
                        },
                        title: "Last name",
                      ),
                    ),
                    FadeAnimation(
                      delay: 0.95,
                      child: AppTextField(
                        hintText: "Email",
                        textInputType: TextInputType.emailAddress,
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: state.firstName,
                            lastname: state.lastName,
                            username: state.username,
                            email: v,
                            password: state.password,
                            duplicatePass: state.duplicatePass,
                          );
                        },
                        title: "Email",
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: AppTextField(
                        hintText: "User name",
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: state.firstName,
                            lastname: state.lastName,
                            username: v,
                            email: state.email,
                            password: state.password,
                            duplicatePass: state.duplicatePass,
                          );
                        },
                        title: "User name",
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.1,
                      child: AppTextField(
                        hintText: "Password",
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: state.firstName,
                            lastname: state.lastName,
                            username: state.username,
                            email: state.email,
                            password: v,
                            duplicatePass: state.duplicatePass,
                          );
                        },
                        title: "Password",
                        isPassword: true,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: AppTextField(
                        hasTitle: false,
                        hintText: "Duplicate password",
                        onChanged: (v) {
                          SignUpCubit.to.name(
                            firstName: state.firstName,
                            lastname: state.lastName,
                            username: state.username,
                            email: state.email,
                            password: state.password,
                            duplicatePass: v,
                          );
                        },
                        isPassword: true,
                        title: '',
                      ).paddingOnly(top: 10.w),
                    ),
                    FadeAnimation(
                      delay: 1.3,
                      child: AppWidgets.appButton(
                        title: "Sign up",
                        onTap: () {
                          SignUpCubit.to.signup();
                        },
                      ).paddingOnly(
                        top: 20.w,
                        bottom: 10.w,
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Have you registered before?",
                            textAlign: TextAlign.end,
                            color: ColorName.gray2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed(LoginPage.routeName);
                            },
                            child: AppWidgets.textLocale(
                              localeKey: "   Login",
                              textAlign: TextAlign.end,
                              color: ColorName.green,
                            ),
                          ),
                        ],
                      ),
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
