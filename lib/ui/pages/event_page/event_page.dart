import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/utils/assets.gen.dart';
import 'package:ticket/core/utils/colors.gen.dart';
import 'package:ticket/ui/pages/event_page/event_cubit/event_cubit.dart';
import 'package:ticket/ui/pages/event_page/widgets/ticket_item_widget.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';

class EventModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          EventPage.routeName,
          child: (context, args) => const EventPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Bind<EventCubit>(
        //   (i) => EventCubit()..load(),
        //   onDispose: (value) => value.close(),
        // ),
      ];
}

class EventPage extends StatefulWidget {
  static String routeName = "/eventPage";

  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<EventCubit, EventState>(
          bloc: EventCubit.to,
          builder: (context, state) {
            return Container(
              color: Colors.white54,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorName.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.textLocale(
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
                            fontSize: 22.sp,
                            color: ColorName.green1,
                            fontWeight: FontWeight.w700,
                          ),
                          Assets.images.icons.search.svg(
                            color: ColorName.green1,
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20.w, vertical: 15.w),
                    ),
                    AppWidgets.textLocale(
                      localeKey: "All events",
                      fontSize: 22.sp,
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w700,

                    ).paddingAll(20.w),
                    SizedBox(
                      height: 221.w,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: state.tickets.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => TicketItemWidget(
                            onTap: () {},
                            onTapBuy: () {},
                            ticket: state.tickets[index],
                          ).paddingOnly(
                              right:
                                  index == state.tickets.length - 1 ? 20.w : 0),
                        ),
                      ),
                    ),
                    AppWidgets.textLocale(
                      localeKey: "Concerts",
                      fontSize: 22.sp,
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w700,

                    ).paddingAll(20.w),
                    SizedBox(
                      height: 221.w,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: state.concertsTickets.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            int ind=Random().nextInt(state.concertsTickets.length) ;
                            return TicketItemWidget(
                              onTap: () {},
                              onTapBuy: () {},
                              ticket: state.concertsTickets[ind],
                            ).paddingOnly(
                                right:
                                index == state.concertsTickets.length - 1 ? 20.w : 0);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
