import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/curved_edges_widget.dart';
import 'package:ninja_store/utils/constants/colors.dart';

class NPrimaryHeaderContainer extends StatelessWidget {
  const NPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NCurvedWidget(
      child: Container(
        color: NColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(children: [SizedBox(width: 500, height: 400)]),
        ),
      ),
    );
  }
}
