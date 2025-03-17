import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/curved_edges.dart';

class NCurvedWidget extends StatelessWidget {
  const NCurvedWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: NCustomCurvedEdges(), child: child);
  }
}
