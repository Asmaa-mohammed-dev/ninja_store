
import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:ninja_store/common/widgets/custom_shapes/cart_menu_icon/cart_menu_icon.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/text_strings.dart';

class NHomeAppBar extends StatelessWidget {
  const NHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NTexts.homeAppbarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            NTexts.homeAppbarSubTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
      actions: [
        NCartCountericon(
          onPressed: () {},
          iconColor: NColors.white,
        ),
      ],
    );
  }
}
