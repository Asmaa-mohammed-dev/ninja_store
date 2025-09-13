import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NVerticalProductShimmer extends StatelessWidget {
  const NVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return NGridLayout(
      itemCount: itemCount,
      itemBuilder:
          (_, __) => const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                NShimmerEffect(width: 180, height: 180),
                SizedBox(height: NSizes.spaceBtwItems),
                //Text
                NShimmerEffect(width: 160, height: 15),
                SizedBox(height: NSizes.spaceBtwItems / 2),
                NShimmerEffect(width: 110, height: 15),
              ],
            ),
          ),
    );
  }
}
