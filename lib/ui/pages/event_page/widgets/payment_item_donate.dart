import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';
import 'package:ticket/ui/widgets/app_text_field.dart';

import '../../../../core/models/payment_model.dart';
import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class PaymentItemDonate extends StatelessWidget {
  final List listProject;
  final int index;

  PaymentItemDonate(
      {super.key, required this.listProject, required this.index});

  List<Payments> listPayment = const [
    Payments("assets/images/icons/click_logo.svg", "click"),
    Payments("assets/images/icons/payme_logo.svg", "payme"),
    Payments("assets/images/icons/uzum_logo.svg", "uzum")
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            localeKey: "Choose payment sestem",
            color: ColorName.gray6,
          ).paddingOnly(bottom: 10.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              listPayment.length,
              (index) => paymentsWidget(
                icon: AppWidgets.imageSvg(path: listPayment[index].paymentsUrl),
                // borderColor: listPayment[index].paymentName ==
                //         state.selectedPayment
                //     ? ColorName.green1
                //     : ColorName.white,
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
