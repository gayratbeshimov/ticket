import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/core/utils/colors.gen.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';

class TicketItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final TicketModel ticket;

  const TicketItemWidget({Key? key, required this.onTap, required this.ticket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 240.w,
          height: 180.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(ticket.thumbnail ?? ""),
            ),
          ),
        ),
        Positioned(
          bottom: 20.w,
          left: 20.w,
          child: AppWidgets.appButton(
            title: "Buy",
            color: ColorName.green1.withOpacity(.5),
            onTap: onTap,
            width: 80.w,
            height: 40.w,
          ),
        ),
        Positioned(
          top: 10.w,
          right: 10.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: ColorName.white.withOpacity(0.8),
            ),
            child: AppWidgets.textLocale(
              localeKey: "${ticket.ticketPrice} ${ticket.currency}",

            ).paddingAll(2.w),
          ),
        ),

      ],
    );
  }
}
