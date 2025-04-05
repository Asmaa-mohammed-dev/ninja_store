import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/device/device_utility.dart';

class NTabBar extends StatelessWidget implements PreferredSizeWidget {
  const NTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: NColors.primary,
        labelColor: NColors.primary,
        unselectedLabelColor: NColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(NDeviceUtils.getAppBarHeight());
}
