import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ninja_store/utils/constants/colors.dart';
import 'package:ninja_store/utils/constants/shimmer.dart';
import 'package:ninja_store/utils/constants/sizes.dart';

class NCircularImage extends StatelessWidget {
  const NCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.padding = NSizes.sm,
    this.overlayColor,
    required this.image,
  });

  final double width, height, padding;
  final String image;
  final BoxBorder? border;
  final Color? overlayColor;
  final Color? backgroundColor;
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

      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child:
              isNetworkImage
                  ? CachedNetworkImage(
                    fit: fit,
                    imageUrl: image,
                    color: overlayColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const NShimmerEffect(width: 55, height: 55),
                  )
                  : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                  ),
        ),
      ),
    );
  }
}
