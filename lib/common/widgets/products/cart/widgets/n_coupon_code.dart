import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCouponCode extends StatelessWidget {
  const NCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return NRoundedContainer(
      showBorder: true,
      backgroundColor: NColors.white,
      padding: const EdgeInsets.only(
        top: NSizes.sm,
        bottom: NSizes.sm,
        right: NSizes.sm,
        left: NSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 17,
              ),
              decoration: const InputDecoration(
                hintText: ' هل تملك كوبون ',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          //Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: NColors.dark.withValues(alpha: 0.5),
                backgroundColor: NColors.grey.withValues(alpha: 0.5),
                side: BorderSide(color: NColors.grey.withValues(alpha: 0.1)),
              ),
              child: Text(
                'تم  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
