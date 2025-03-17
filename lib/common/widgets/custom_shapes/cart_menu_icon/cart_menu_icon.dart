import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NCartCountericon extends StatelessWidget {
  const NCartCountericon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });
  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: NColors.black,
              borderRadius: BorderRadius.circular(180),
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
