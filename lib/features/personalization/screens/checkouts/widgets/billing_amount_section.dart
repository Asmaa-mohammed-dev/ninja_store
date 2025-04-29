import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBillingAmountSection extends StatelessWidget {
  const NBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Text(
                'الإجمالي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              '\$256',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: NSizes.spaceBtwItems / 2),

        //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Text(
                'رسوم الشحن',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              '\$6',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: NSizes.spaceBtwItems / 2),

        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Text(
                'المبلغ الإجمالي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              '\$6',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'MAJALLA',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
