import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/bloc/app_navigation/app_navigation_bloc.dart';
import '../../../../core/utils/colors.gen.dart';
import 'app_navigation_bar_item.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key, required this.children});

  final List<AppNavigationBarItem> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      height: 70.w,
      width: MediaQuery.of(context).size.width,
      decoration:const  BoxDecoration(
        color: ColorName.green1,
        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 5,
            spreadRadius: -2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }


  Widget bodyBuilder(
      AppNavigationType appNavigationType,
      BuildContext context,
      ) {
    switch (appNavigationType) {
      case AppNavigationType.EVENT:
        return Container();
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
