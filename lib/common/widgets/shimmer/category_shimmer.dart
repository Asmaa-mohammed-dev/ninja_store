import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCategoryShimmer extends StatelessWidget {
  const NCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (_, __) => const SizedBox(width: NSizes.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              NShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: NSizes.spaceBtwItems / 2),

              //text
              NShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
