import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/ui/pages/event_page/event_page.dart';
import 'package:ticket/ui/pages/home_page/widgets/app_navigation_bar.dart';
import 'package:ticket/ui/pages/home_page/widgets/app_navigation_bar_item.dart';

import '../../../core/bloc/app_navigation/app_navigation_bloc.dart';
import '../../../core/bloc/language_cubit/language_cubit.dart';
import '../../../core/routes/auth_guard.dart';
import '../../../core/routes/module_init_guard.dart';
import '../../../core/utils/assets.gen.dart';
import '../../../core/utils/colors.gen.dart';
import '../event_page/event_cubit/event_cubit.dart';

class HomePageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => const HomePage(),
          guards: [
            ModuleInitGuard(),
            AuthGuard(),
          ],
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<AppNavigationBloc>(
          (i) => AppNavigationBloc(),
          onDispose: (value) => value.close(),
        ),
        Bind<EventCubit>(
          (i) => EventCubit()..load(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class HomePage extends StatelessWidget {
  static String routeName = "/homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Modular.get<AppNavigationBloc>();
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: LanguageCubit.to,
      builder: (context, state) {
        return BlocBuilder<AppNavigationBloc, AppNavigationState>(
          bloc: bloc,
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                extendBody: true,
                body: bodyBuilder(state.appNavigationType, context),
                bottomNavigationBar: AppNavigationBar(
                  children: [
                    AppNavigationBarItem(
                      onPressed: () {
                        bloc.add(
                          const AppNavigationChanged(
                            appNavigationType: AppNavigationType.EVENT,
                          ),
                        );
                      },
                      icon: Assets.images.icons.shopping
                          .svg(color: ColorName.white),
                      iconOnTap: Assets.images.icons.shopping
                          .svg(color: ColorName.bluePercent),
                      title: "Events",
                      isActive:
                          state.appNavigationType == AppNavigationType.EVENT,
                    ),
                    AppNavigationBarItem(
                      onPressed: () {
                        bloc.add(
                          const AppNavigationChanged(
                            appNavigationType: AppNavigationType.BASKET,
                          ),
                        );
                      },
                      icon: Assets.images.icons.shopping
                          .svg(color: ColorName.white),
                      iconOnTap: Assets.images.icons.shopping
                          .svg(color: ColorName.bluePercent),
                      title: "Baskets",
                      isActive:
                          state.appNavigationType == AppNavigationType.BASKET,
                    ),
                    AppNavigationBarItem(
                      onPressed: () {
                        bloc.add(
                          const AppNavigationChanged(
                            appNavigationType: AppNavigationType.MYTICKETS,
                          ),
                        );
                      },
                      icon: Assets.images.icons.pieChart
                          .svg(color: ColorName.white),
                      iconOnTap: Assets.images.icons.pieChartActive.svg(),
                      title: "My ticket",
                      isActive: state.appNavigationType ==
                          AppNavigationType.MYTICKETS,
                    ),
                    AppNavigationBarItem(
                      onPressed: () {
                        bloc.add(
                          const AppNavigationChanged(
                            appNavigationType: AppNavigationType.PROFILE,
                          ),
                        );
                      },
                      icon:
                          Assets.images.icons.draft.svg(color: ColorName.white),
                      iconOnTap: Assets.images.icons.draftActive.svg(),
                      title: "Profile",
                      isActive:
                          state.appNavigationType == AppNavigationType.PROFILE,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget bodyBuilder(
    AppNavigationType appNavigationType,
    BuildContext context,
  ) {
    switch (appNavigationType) {
      case AppNavigationType.EVENT:
        return const EventPage();
      case AppNavigationType.BASKET:
        return Container();
      case AppNavigationType.MYTICKETS:
        return Container();
      case AppNavigationType.PROFILE:
        return Container();
      default:
        return Container();
    }
  }
}
