import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/core/utils/assets.gen.dart';
import 'package:ticket/core/utils/colors.gen.dart';
import 'package:ticket/ui/pages/event_page/widgets/event_item_widget.dart';
import 'package:ticket/ui/pages/event_page/widgets/payment_item_donate.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';
import 'package:ticket/core/extensions/app_extensions.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white54,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorName.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Ticket",
                      fontSize: 20.sp,
                      color: ColorName.green1,
                      fontWeight: FontWeight.w700,
                    ),
                    Assets.images.icons.search.svg(
                      color: ColorName.green1,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w, vertical: 15.w),
              ),
              TicketItemWidget(
                onTap: () {},
                ticket: TicketModel(
                  thumbnail: "assets/images/img_1.png",
                ),
              ),
              PaymentItemDonate(listProject: [],index: 0,)
            ],
          ),
        ),
      ),
    );
  }
}
