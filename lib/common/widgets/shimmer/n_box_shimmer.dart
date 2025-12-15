import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NBoxShimmer extends StatelessWidget {
  const NBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: NShimmerEffect(width: 150, height: 110)),
            SizedBox(width: NSizes.spaceBtwItems),
        Expanded(child: NShimmerEffect(width: 150, height: 110)),
        SizedBox(width: NSizes.spaceBtwItems),
Expanded(child: NShimmerEffect(width: 150, height: 110)),
        SizedBox(width: NSizes.spaceBtwItems),
          ],
        ),
        
      ],
    );
  }
}