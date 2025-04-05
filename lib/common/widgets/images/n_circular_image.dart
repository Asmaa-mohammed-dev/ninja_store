import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCircularImage extends StatelessWidget {
  const NCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.border,
    required this.backgroundColor,
    this.fit = BoxFit.cover,
    required this.isNetworkImage,
    this.padding = NSizes.sm,
    required this.overlayColor,
    required this.image,
  });

  final double width, height, padding;
  final String image;
  final BoxBorder? border;
  final Color overlayColor;
  final Color backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: NColors.white,
        borderRadius: BorderRadius.circular(100),
      ),

      child: Center(
        child: Image(
          fit: fit,
          image:
              isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
