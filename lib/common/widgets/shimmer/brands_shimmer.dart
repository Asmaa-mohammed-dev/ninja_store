import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/layouts/grid_layout.dart';
import 'package:ninja_store/common/widgets/shimmer/shimmer.dart';

class NBrandShimmer extends StatelessWidget {
  const NBrandShimmer({super.key, this.itemCount = 4});

final int itemCount;
  @override
  Widget build(BuildContext context) {
    return  NGridLayout(itemCount: itemCount, itemBuilder: (_, __) => const NShimmerEffect(width: 300, height: 80),
      
    );
  }
}