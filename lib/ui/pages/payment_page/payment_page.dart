import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/ui/pages/payment_page/payment_cubit/payment_cubit.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../core/utils/assets.gen.dart';
import '../../widgets/app_widgets.dart';

class PaymentModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PaymentsPage.routeName,
          child: (context, args) => PaymentsPage(
            ticket: Modular.args.data,
          ),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<PaymentCubit>(
          (i) => PaymentCubit()..load(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class PaymentsPage extends StatelessWidget {
  final TicketModel ticket;
  static String routeName = "/payments";

  const PaymentsPage({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: AppWidgets.appButton(
            title: "",
            color: ColorName.white.withOpacity(0.5),
            textColor: ColorName.green1,
            fontSize: 12.sp,
            width: 70.w,
            height: 25.w,
            icon: Assets.images.icons.backArrow.svg(color: ColorName.green1),
            onTap: () {
              Modular.to.pop();
            },
          ),
          title: AppWidgets.appName(),
          centerTitle: true,
          backgroundColor: ColorName.white,
          elevation: 4.2,
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          bloc: PaymentCubit.to,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ticket.thumbnail ?? ""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Price:",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                    AppWidgets.textLocale(
                      localeKey: "${ticket.ticketPrice} ${ticket.currency} ",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ],
                ).paddingAll(20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Name:",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                    AppWidgets.textLocale(
                      localeKey: "${ticket.name}",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ],
                ).paddingAll(20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "Place:",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                    AppWidgets.textLocale(
                      localeKey: "${ticket.place}",
                      color: ColorName.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ],
                ).paddingAll(20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppWidgets.textLocale(
                        localeKey: "Description:",
                        color: ColorName.mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                    Expanded(
                      child: AppWidgets.textLocale(
                        localeKey: "${ticket.description}",
                        textAlign: TextAlign.end,
                        maxLines: 30,
                        color: ColorName.mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ).paddingAll(20.w),
                AppWidgets.appButton(
                  title: "BUY",
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Container(
                        height: 300.w,
                        decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppWidgets.sizedBox(),
                                Assets.images.icons.bottomArrow
                                    .svg(color: ColorName.gray6),
                                GestureDetector(
                                  onTap: () {
                                    Modular.to.pop();
                                  },
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                    child: Assets.images.icons.xIcon
                                        .svg(color: ColorName.gray6),
                                  ),
                                ),
                              ],
                            ).paddingAll(20.w),
                            AppWidgets.textLocale(
                              localeKey:
                                  "Choose your convenient payment system!",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              color: ColorName.mainColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  state.listPayment.length,
                                  (index) => paymentsWidget(
                                    icon: AppWidgets.imageSvg(
                                        path: state
                                            .listPayment[index].paymentsUrl,
                                        fit: BoxFit.fill),
                                    borderColor: state.listPayment[index] ==
                                            state.selectPay
                                        ? ColorName.green1
                                        : ColorName.white,
                                    onTap: () {
                                      PaymentCubit.to.selectMethod(
                                          payment: state.listPayment[index]);
                                      Modular.to.pop();
                                    },
                                  ),
                                ),
                              ),
                            ).paddingAll(20.w),
                          ],
                        ),
                      ),
                    );
                  },
                  width: 200.w,
                ).paddingAll(40.w),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget paymentsWidget({
    required VoidCallback onTap,
    Color? borderColor = ColorName.primaryColor,
    required Widget icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: ColorName.mainColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: borderColor!,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                height: 60.w,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
