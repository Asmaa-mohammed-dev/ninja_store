import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key,
  this.itemCount = 4
  });
 final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index) => const SizedBox(width: NSizes.spaceBtwItems),
        itemBuilder: (_,__) => const Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            //Image
            NShimmerEffect(width: 120, height: 120),
            SizedBox(width: NSizes.spaceBtwItems,),
            ///Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: NSizes.spaceBtwItems / 2
                ),
              ],
            ),
          ],),
      ),
    );
  }
}