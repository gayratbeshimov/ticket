import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket/core/extensions/app_extensions.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';


class AppNavigationBarItem extends StatelessWidget {
  const AppNavigationBarItem({
    required this.onPressed,
    required this.icon,
    required this.iconOnTap,
    required this.title,
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final Widget iconOnTap;
  final bool isActive;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          children: [
            Container(
              height: 26.w,
              width: 41.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorName.primaryColor,
              ),
              child: isActive ? iconOnTap.paddingAll(2) : icon.paddingAll(2),
            ),
            const SizedBox(
              height: 3,
            ),
            AppWidgets.textLocale(
              localeKey: title.tr(),
              fontSize: 12,
              color: isActive ? ColorName.bluePercent : ColorName.defaultIcon,
            )
          ],
        ),
      ),
    );
  }
}
