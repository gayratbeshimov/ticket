import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/core/utils/colors.gen.dart';
import 'package:ticket/ui/widgets/app_widgets.dart';

class TicketItemWidget extends StatelessWidget {
  final VoidCallback onTapBuy;
  final VoidCallback onTap;
  final TicketModel ticket;

  const TicketItemWidget({
    Key? key,
    required this.onTapBuy,
    required this.onTap,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 340.w,
            height: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorName.white.withOpacity(0.5),
              border: Border.all(
                width: 1.w,
                color: ColorName.green1.withOpacity(0.6),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(ticket.thumbnail ?? ""),
              ),
            ),
          ),
          Positioned(
            bottom: 10.w,
            left: 10.w,
            child: AppWidgets.appButton(
              title: "Buy",
              color: ColorName.green1.withOpacity(.5),
              onTap: onTapBuy,
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
                color: ColorName.mainColor,
                fontWeight: FontWeight.w500,
              ).paddingAll(2.w),
            ),
          ),
        ],
      ).paddingOnly(
        top: 10.w,
        left: 20.w,
        bottom: 10,
      ),
    );
  }
}
