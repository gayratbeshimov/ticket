
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/ui/pages/event_page/event_page.dart';
import 'package:ticket/ui/pages/home_page/home_page.dart';
import 'package:ticket/ui/pages/home_page/login_page/login_page.dart';
import 'package:ticket/ui/pages/sign_up_page/sign_up_page.dart';

import 'core/bloc/language_cubit/language_cubit.dart';
import 'core/services/hive_service.dart';
import 'core/services/http_service/http_service.dart';
import 'core/services/http_service/signup_and_login_service.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(HomePage.routeName);
    Modular.setObservers([BotToastNavigatorObserver()]);
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: LanguageCubit.to,
      buildWhen: (previous, current) {
        () => context.setLocale(current);
        return true;
      },
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 817),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            title: "Ticket",
            debugShowCheckedModeBanner: false,
            locale: state,
            builder: EasyLoading.init(
              builder: BotToastInit(),
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<HttpService>((i) => HttpService.init()),

        Bind.singleton<LanguageCubit>(
          (i) => LanguageCubit(),
          onDispose: (v) => v.close(),
        ),
    Bind<HiveService>((i) => HiveService.init()),
        // AsyncBind<LocaleDbService>((i) => LocaleDbService.init()),
        Bind.lazySingleton<SignUpAndLoginService>(
            (i) => SignUpAndLoginService()),

        // Bind.lazySingleton<AccountService>((i) => AccountService()),
        // Bind.lazySingleton<RequestService>((i) => RequestService()),
        // Bind<SyncDataBloc>(
        //       (i) => SyncDataBloc(),
        //   onDispose: (v) => v.close(),
        // ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: HomePageModule()),
        ModuleRoute("/", module: SignupModule()),
        ModuleRoute("/", module: LoginPageModule()),
        ModuleRoute("/", module: EventModule()),


      ];
}
