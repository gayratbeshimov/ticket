import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/ui/pages/payment_page/payment_cubit/payment_cubit.dart';
import 'package:ticket/ui/widgets/app_text_field.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../widgets/app_widgets.dart';

class PaymentModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          PaymentsPage.routeName,
          child: (context, args) => const PaymentsPage(),
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
  static String routeName = "/payments";

  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWidgets.textLocale(
                localeKey: "Choose payment system",
                color: ColorName.gray6,
              ).paddingOnly(bottom: 10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  state.listPayment.length,
                  (index) => paymentsWidget(
                    icon: AppWidgets.imageSvg(
                        path: state.listPayment[index].paymentsUrl,
                        fit: BoxFit.fill),
                    borderColor:
                        state.listPayment[index] == state.selectPay
                            ? ColorName.green1
                            : ColorName.white,
                    onTap: () {},
                  ),
                ),
              ),
              AppWidgets.textLocale(
                localeKey: "Write sum",
                color: ColorName.gray6,
              ).paddingOnly(
                top: 24.w,
                bottom: 10.w,
              ),
              AppTextField(
                hintText: "100 000 UZS",
                onChanged: (v) {},
                title: '',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget paymentsWidget({
    required VoidCallback onTap,
    Color? borderColor = ColorName.gray6,
    required Widget icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 104.w,
        height: 88.w,
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: borderColor!,
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
