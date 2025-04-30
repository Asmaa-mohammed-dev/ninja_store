import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ninja_store/common/widgets/custom_shapes/rounded_container.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NOrderList extends StatelessWidget {
  const NOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 15,
        separatorBuilder:
            (_, index) => const SizedBox(height: NSizes.spaceBtwItems),
        itemBuilder:
            (_, index) => NRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(NSizes.md),
              backgroundColor: NColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Row
                  Row(
                    children: [
                      //Icon
                      Icon(Iconsax.ship),
                      SizedBox(width: NSizes.spaceBtwItems / 2),
                      //Status And date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'جارٍ المعالجة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MAJALLA',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '01 October 2025',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MAJALLA',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Icon
                      IconButton(
                        onPressed: () {},
                        icon: Transform.rotate(
                          angle: 3.14,
                          child: const Icon(
                            Iconsax.arrow_right_34,
                            size: NSizes.iconSm,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NSizes.spaceBtwItems),
                  //Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            //Icon
                            Icon(Iconsax.tag),
                            SizedBox(width: NSizes.spaceBtwItems / 2),
                            //Status And date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' الاوردر',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MAJALLA',
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '256347',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MAJALLA',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            //Icon
                            Icon(Iconsax.calendar),
                            SizedBox(width: NSizes.spaceBtwItems / 2),
                            //Status And date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' موعد الشحن',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MAJALLA',
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '3 Feb 2025',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MAJALLA',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
